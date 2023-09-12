#include <sys/epoll.h>

#include "Channel.h"
#include "Logger.h"

const int Channel::kNoneEvent = 0;
const int Channel::kReadEvent = EPOLLIN | EPOLLPRI; //表示可读事件或紧急可读事件
const int Channel::kWriteEvent = EPOLLOUT; //表示可写事件

//EventLoop = ChannelList + Poller
Channel::Channel(EventLoop* loop, int fd) 
    : loop_(loop), fd_(fd), events_(0), revents_(0), index_(-1), tied_(false)
    {}

Channel::~Channel() {}

//？？？
//当监听过对象后，调用tie函数
void Channel::tie(const std::shared_ptr<void>& obj){
    tie_ = obj;
    tied_ = true;
}

void Channel::update(){
    //通过channel所属的Eventloop，调用poller相应方法，注册fd的events事件（epoll_ctl）
    //add code ...
    //loop_->updateChannel(this);
}
//在Channel所属的EventLoop中，删除当前的channel
void Channel::remove(){
    //add code ...
    // loop_->removeChannel(this);
}

void Channel::handleEvent(Timestamp receiveTime){
    std::shared_ptr<void> guard;
    if(tied_){ //如果监听过对象
        guard = tie_.lock();
        if(guard){ //监听的对象是否存在
            handleEventWithGuard(receiveTime);
        }
    }else{
        handleEventWithGuard(receiveTime);
    }
}

//根据poller监听到的具体事件，由channel负责调用具体的回调函数
void Channel::handleEventWithGuard(Timestamp recviveTime){
    LOG_INFO("Channel handleEvent revents:%d\n", revents_);
    //对端关闭连接或者没有可读事件
    if((revents_ & EPOLLHUP) && !(revents_ & EPOLLIN)){
        //当 closeCallback_ 不为 null 且有可调用的内容时，它可以被调用
        if(closeCallback_)  closeCallback_();
    }

    if(revents_ & EPOLLERR){
        if(errorCallback_) errorCallback_();
    }
    if(revents_ & (EPOLLIN | EPOLLPRI | EPOLLRDHUP)){
        if(readCallback_) readCallback_(recviveTime);
    }
    if(revents_ & EPOLLOUT){
        if(writeCallback_) writeCallback_;
    }
}