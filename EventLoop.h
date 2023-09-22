#pragma once
#include <functional>
#include <vector>
#include <atomic>
#include <memory>
#include <mutex>

#include "noncopyable.h"
#include "Timestamp.h"
#include "CurrentThread.h"

class Poller;
class Channel;

//时间循环类  主要包含两大模块 channel   poller（epoll的抽象）
class EventLoop : noncopyable{
public:
    using Functor = std::function<void()>;

    EventLoop();
    ~EventLoop();

    void loop(); //开启事件循环
    void quit(); //退出事件循环

    Timestamp pollReturnTime() const { return pollReturnTime_;}

    void runInLoop(Functor cb); //在当前loop中执行cb
    void queueInLoop(Functor cb); //把cb放入队列中，唤醒loop所在线程并执行cb

    void wakeup(); //唤醒loop所在的线程

    //EventLoop的方法=> poller的方法
    void updateChannel(Channel* channel);
    void removeChannel(Channel* channel);
    bool hasChannel(Channel* channel);
    //判断EventLoop对象是否在自己的线程里面
    bool isInLoopThread() const { return threadId_ == CurrentThread::tid(); }
private:
    void handleRead(); //waked up
    void doPendingFunctors(); //执行回调

    using ChannelList = std::vector<Channel*>;
    std::atomic_bool looping_; //原子操作，通过CAS实现，记录当前eventloop是否在运行
    std::atomic_bool quit_; //标识退出loop循环

    const pid_t threadId_; //记录当前loop所在线程的id
    
    Timestamp pollReturnTime_; //poller返回发生事件的channels的时间点
    std::unique_ptr<Poller> poller_;

    int wakeupFd_; //主要作用：当mainloop获取一个新用户的channel，通过轮询算法选择一个subloop，并唤醒
    std::unique_ptr<Channel> wakeupChannel_;
    ChannelList activeChannels_;
    Channel* currentActiveChannel_;

    std::atomic_bool callingPendingFunctors_; //标识当前loop是否有需要执行回调操作
    std::vector<Functor> pendingFunctors_; //储存loop需要执行的所有回调操作
    std::mutex mutex_; //互斥锁，用来保护上面vector容器的线程安全操作

};

