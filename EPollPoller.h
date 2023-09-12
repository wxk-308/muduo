#pragma once

#include <vector>
#include <sys/epoll.h>


#include "Poller.h"
#include "Timestamp.h"
#include "Channel.h"

/*epoll使用
epoll_create
epoll_ctl   add/mod/delete
epoll_wait:用于等待文件描述符上发生的事件，并将已经发生的事件返回给调用者
*/
class EPollPoller : public Poller
{
public:
    EPollPoller(EventLoop* loop); //epoll_create 将fd储存到epollfd_
    ~EPollPoller() override;
    //重写基类poller的抽象方法
    Timestamp poll(int timeoutMs, ChannelList* activeChannels) override; //epoll_wait
    void updateChannel(Channel* channel) override;
    void removeChannel(Channel* channel) override;
private:
    static const int kInitEventListSize = 16; //定义EventList的初始化长度
    //填写活跃的连接
    void fillActiveChannels(int numEvents, ChannelList* activeChannels) const;
    //更新channel通道
    void update(int operation, Channel* channel);
    /*epoll_event在c中定义
    struct epoll_event {
        uint32_t events;  // 事件类型，例如 EPOLLIN、EPOLLOUT 等
        epoll_data_t data;  // 用户数据，通常是一个指针
    };*/
    using EventList = std::vector<epoll_event>;
    
    int epollfd_;
    EventList events_;
};