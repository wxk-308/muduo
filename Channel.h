#pragma once

#include <functional>
#include <memory>

#include "noncopyable.h"
#include "Timestamp.h"
//前向声明，而不采用include的方式，减少头文件的暴露，降低编译难度和时间
class EventLoop;

//通道类   封装了sockfd和感兴趣的evetn，如EPOLLIN,EPOLLOUT事件
//还封装了epoll返回的具体事件
class Channel : noncopyable {
public:
    /*EventCallback 是一个类型别名，表示一个无参数的函数对象（回调函数），该函数对象返回 void。
    通常用于表示一般的事件回调，当事件触发时，可以执行与该事件相关的操作。*/
    using EventCallback = std::function<void()>;
    /*ReadEventCallback 也是一个类型别名，表示一个带有一个参数的函数对象，该参数的类型是 Timestamp，
    并且该函数对象返回 void。通常用于表示读事件的回调，其中 Timestamp 可能表示事件发生的时间戳或
    其他与事件相关的信息。*/
    using ReadEventCallback = std::function<void(Timestamp)>;


    Channel(EventLoop* loop, int fd);
    ~Channel();

    //fd得到poller通知以后，处理事件
    void handleEvent(Timestamp receiveTime); 

    //设置回调函数对象
    void setReadCallback(ReadEventCallback cb){ readCallback_ = std::move(cb);}
    void setWriteCallback(EventCallback cb) { writeCallback_ = std::move(cb);}
    void setCloseCallback(EventCallback cb) { closeCallback_ = std::move(cb);}
    void setErrorCallback(EventCallback cb) { errorCallback_ = std::move(cb);}

    //防止当channel被手动remove掉，channel还在执行回调操作
    void tie(const std::shared_ptr<void>&);

    int fd() const { return fd_; }
    int events() const { return events_; }
    void set_revents(int revt) { revents_ = revt; }// Poller发出

    //返回fd当前的事件状态
    bool isNoneEvent() const { return events_ == kNoneEvent; }
    bool isWriting() const { return events_ & kWriteEvent; }
    bool isReading() const { return events_ & kReadEvent; }

    //设置fd相应的事件状态,向poll中注册感兴趣的事件
    void enableReading() { events_ |= kReadEvent; update(); }
    void disableReading() { events_ &= ~kReadEvent; update(); }
    void enableWriting() { events_ |= kWriteEvent; update(); }
    void disableWriting() { events_ &= ~kWriteEvent; update(); }
    void disableAll() { events_ = kNoneEvent; update(); }

    int index() { return index_; }
    void set_index(int idx) { index_ = idx; }

    //one loop per thread
    EventLoop* ownerLoop() { return loop_; }
    void remove(); //用于删除channel

private:
    //就简单理解成fd的状态
    static const int kNoneEvent;
    static const int kReadEvent;
    static const int kWriteEvent;

    EventLoop* loop_; //事件循环
    const int fd_; //Poller监听的对象
    int events_; //注册fd感兴趣的事件
    int revents_; //Poller返回的具体发生事件
    int index_; //当前channel添加到poll中的状态
    std::weak_ptr<void> tie_; //跨线程的 对象生存状态的监听
    bool tied_; //标志当前对象是否与其他对象绑定

    //channel通道里面能获知fd最终发生的具体事件revents，所以它负责调用具体事件的回调操作
    ReadEventCallback readCallback_;
    EventCallback writeCallback_;
    EventCallback closeCallback_;
    EventCallback errorCallback_;

    void update();
    //估计上述中的handleEvent（）是对handleEventWithGuard的封装
    void handleEventWithGuard(Timestamp recviveTime);
};


