#include <sys/epoll.h>

#include "Channel.h"
#include "Logger.h"
#include "EventLoop.h"

const int Channel::kNoneEvent = 0;
const int Channel::kReadEvent = EPOLLIN | EPOLLPRI; //0x001 0x002 表示可读事件或紧急可读事件
const int Channel::kWriteEvent = EPOLLOUT; //0x004 表示可写事件

//EventLoop = ChannelList + Poller
Channel::Channel(EventLoop* loop, int fd) 
    : loop_(loop), fd_(fd), events_(0), revents_(0), index_(-1), tied_(false)
    {}

Channel::~Channel() {}

//一个Tcpconnection新连接创建的时候
//当监听过对象后，调用tie函数
void Channel::tie(const std::shared_ptr<void>& obj){
    tie_ = obj;
    tied_ = true;
}

void Channel::update(){
    //通过channel所属的Eventloop，调用poller相应方法，注册fd的events事件（epoll_ctl）
    loop_->updateChannel(this);
}
//在Channel所属的EventLoop中，删除当前的channel
void Channel::remove(){
    loop_->removeChannel(this);
}

void Channel::handleEvent(Timestamp receiveTime){
    if(tied_){ //如果监听过对象
        std::shared_ptr<void> guard = tie_.lock();
        if(guard){ //监听的对象是否存在
            handleEventWithGuard(receiveTime);
        }
    }else{
        handleEventWithGuard(receiveTime);
    }
}

//根据poller监听到的具体事件，由channel负责调用具体的回调函数
void Channel::handleEventWithGuard(Timestamp receiveTime){
    LOG_INFO("Channel handleEvent revents:%d\n", revents_);
    //对端关闭连接或者没有可读事件
    if((revents_ & EPOLLHUP) && !(revents_ & EPOLLIN)){
        //EPOLLHUP 远程端口关闭或连接被重置 EPOLLIN:文件描述符可读
        //当 closeCallback_ 不为 null 且有可调用的内容时，它可以被调用
        if(closeCallback_)  closeCallback_();
    }

    if(revents_ & EPOLLERR){
        //错误事件
        if(errorCallback_) errorCallback_();
    }
    if(revents_ & (EPOLLIN | EPOLLPRI)){
        //分别标识可读；紧急数据处理；连接对端关闭或半关闭连接(如关闭了写仍然可以读取)
        if(readCallback_) readCallback_(receiveTime);
    }
    if(revents_ & EPOLLOUT){
        //文件描述符写就绪事件
        if(writeCallback_) writeCallback_();
    }
}