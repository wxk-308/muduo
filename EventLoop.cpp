#include "EventLoop.h"
#include "Logger.h"
#include "Poller.h"
#include "Channel.h"

#include <sys/eventfd.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <memory>
// 防止一个线程创建多个EventLoop thread_local
__thread EventLoop* t_loopInThisThread = nullptr;
// 定义默认的Poller IO复用接口的超时时间
const int kPollTimeMs = 10000;

//创建wakeupfd，用来notify唤醒subReactor处理新来的channel
// eventfd 函数创建了一个用于事件通知的文件描述符 evtfd
int createEventfd(){
    int evtfd = ::eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC);
    if(evtfd < 0 ){
        LOG_FATAL("eventfd error :%d \n", errno);
    }
    return evtfd;
}

EventLoop::EventLoop()
    : looping_(false)
    , quit_(false)
    , callingPendingFunctors_(false)
    , threadId_(CurrentThread::tid())
    , poller_(Poller::newDefaultPoller(this))
    , wakeupFd_(createEventfd())
    , wakeupChannel_(new Channel(this, wakeupFd_))
{
    LOG_DEBUG("EventLoop created %p in thread %d \n", this, threadId_);
    if(t_loopInThisThread){
        LOG_FATAL("Another EventLoop %p exists in this thread %d \n", t_loopInThisThread, threadId_);
    }else{
        t_loopInThisThread = this;
    }
    //设置wakeupfd的事件类型以及发生事件后的回调操作
    wakeupChannel_->setReadCallback(std::bind(&EventLoop::handleRead, this));
    //每一个eventLoop都将监听wakeupchannel的EPOLLIN读事件
    wakeupChannel_->enableReading();
}
EventLoop::~EventLoop(){
    wakeupChannel_->disableAll();
    wakeupChannel_->remove();
    ::close(wakeupFd_);
    t_loopInThisThread = nullptr;
}

//开启事件循环
void EventLoop::loop(){
    looping_ = true;
    quit_ = false;
    LOG_INFO("EventLoop %p start looping \n", this);

    while(!quit_){
        activeChannels_.clear();
        //监听两类fd，一种client的fd，一种wakeupfd
        PollerReturnTime_ = poller_->poll(kPollTimeMs, &activeChannels_);
        for(Channel* channel : activeChannels_){
            //Poller监听哪些channel发生事件，然后上报eventloop，通知channel处理相应事件
            channel->handleEvent(PollerReturnTime_);
        }
        //wakeup subloop后，执行之前mainloop注册的回调函数cb
        doPendingFunctors();
    }
    LOG_INFO("EventLoop %p stop looping. \n", this);
    looping_ = false;
}
//退出事件
//两种情况：loop自己线程调用quit；非loop自己线程调用loop的quit函数
void EventLoop::quit(){
    quit_ = true;
    if(!isInLoopThread()){ // 在其他线程中调用quit
        wakeup();
    }
}
//在当前loop中执行cb
void EventLoop::runInLoop(Functor cb){
    if(isInLoopThread()){ //在当前loop线程中，执行cb
        cb();
    }else{ //在非当前loop线程中执行cb，需要唤醒loop所在线程，执行cb
        queueInLoop(cb); 
    }
}
//把cb放在队列中，唤醒loop所在线程，执行cb
void EventLoop::queueInLoop(Functor cb){
    {
        std::unique_lock<std::mutex> lock(mutex_);
        pendingFunctors_.emplace_back(cb);
    }

    //唤醒相应的线程，执行上面回调操作的loop线程
    if(!isInLoopThread() || callingPendingFunctors_){
        wakeup();
    }
}

void EventLoop::handleRead(){
    uint64_t one = 1;
    ssize_t n = read(wakeupFd_, &one, sizeof(one));
    if(n != sizeof(one)){
        LOG_ERROR("EventLoop::handleRead() reads %ld bytes instead of 8", n); 
    }
}

void EventLoop::wakeup(){
    uint64_t one = 1;
    ssize_t n = write(wakeupFd_, &one, sizeof(one));
    if(n != sizeof(one)){
        LOG_ERROR("EventLoop::wakeup() writes %lu bytes instead of 8 \n", n);
    }
}
void EventLoop::updateChannel(Channel* channel){
    poller_->updateChannel(channel);
}
void EventLoop::removeChannel(Channel* channel){
    poller_->removeChannel(channel);
}
bool EventLoop::hasChannel(Channel* channel){
    return poller_->hasChannel(channel);
}

void EventLoop::doPendingFunctors(){
    std::vector<Functor> functors;
    callingPendingFunctors_ = true;
    {
        std::unique_lock<std::mutex> lock(mutex_);
        functors.swap(pendingFunctors_);
    }
    for(const Functor &functor : functors){
        functor();
    }
    callingPendingFunctors_ = false;
}