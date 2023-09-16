#include "EventLoopThread.h"
#include "EventLoop.h"

EventLoopThread::EventLoopThread(const ThreadInitCallback& cb ,const std::string & name )
        : loop_(nullptr)
        , exiting_(false)
        , thread_(std::bind(&EventLoopThread::threadFunc, this), name)
        , mutex_() //默认构造
        , cond_() //默认构造
        , callback_(cb)
{
}
EventLoopThread::~EventLoopThread(){
    exiting_ = true;
    if(loop_ != nullptr){
        loop_->quit();
        thread_.join();
    }
}
//开启事件循环
EventLoop* EventLoopThread::startLoop(){
    thread_.start(); //启动底层的新线程
    EventLoop* loop = nullptr;
    {
        std::unique_lock<std::mutex> lock(mutex_);
        while ( loop_ == nullptr){
            cond_.wait(lock);
        }
        loop = loop_;
    }
    return loop;
} 
void EventLoopThread::threadFunc(){
    EventLoop loop; //创建一个独立的EventLoop，和上面的线程一一对应，实现one loop per thread
    if(callback_){
        callback_(&loop);
    }
    {
        std::unique_lock<std::mutex> lock(mutex_);
        loop_ = &loop;
        cond_.notify_one();
    }

    loop.loop(); //EventLoop loop -》 Poller poll
    std::unique_lock<std::mutex> lock(mutex_);
    loop_ = nullptr;
} 
