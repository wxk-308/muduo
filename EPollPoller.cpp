#include "EPollPoller.h"
#include "Logger.h"
#include "Channel.h"

#include <unistd.h>
#include <errno.h>
#include <string.h>

//表示channel添加到poller中的状态 
//分别表示未添加，已添加，已删除
//channel 成员变量index_初始值为-1，index_表示channel添加到poller中的状态
const int kNew = -1;
const int kAdded = 1;
const int kDeleted = 2;
  
EPollPoller::EPollPoller(EventLoop* loop)
    : Poller(loop),
    epollfd_(::epoll_create1(EPOLL_CLOEXEC)),
    /*设置了 close-on-exec 标志，当新程序启动时，
    这些文件描述符会自动关闭，以避免在新程序中无意中使用它们
    在多线程或多进程环境中使用 epoll 实例时，
    可以防止文件描述符被意外传递到新程序中，从而提高了程序的安全性*/
    events_(kInitEventListSize)
{
    if(epollfd_ < 0) LOG_FATAL("epoll_create error:%d \n", errno);
}
EPollPoller::~EPollPoller(){
    ::close(epollfd_);
}

Timestamp EPollPoller::poll(int timeoutMs, ChannelList* activeChannels) {
    //实际采用LOG_DEBUG更合理，poll函数调用频繁，LOG_INFO会影响性能
    LOG_INFO("Function=%s => fd total count:%lu \n", __FUNCTION__, channels_.size());
    int numEvents = ::epoll_wait(epollfd_, &*events_.begin(), static_cast<int>(events_.size()), timeoutMs);
    int saveErrno = errno;
    Timestamp now = Timestamp::now();

    if(numEvents > 0){ //监听发生事件的fd数量
        LOG_INFO("%d events happened \n", numEvents);
        fillActiveChannels(numEvents, activeChannels);
        if(numEvents == events_.size()){ //对events_进行扩容
            events_.resize(events_.size() * 2);
        }
    }else if(numEvents == 0){ //固定时间内没有发生事件
        LOG_DEBUG("%s timeout! \n",__FUNCTION__);
    }else{
        if(saveErrno != EINTR){ //若不是由外部中断引发的错误，则报错
            errno = saveErrno;
            LOG_ERROR("EPollPoller::poll() err!");
        }
    }

    return now;
}
//channel update&remove => EventLoop updateChannel&removeChannel => Poller updateChannel&removeChannel
void EPollPoller::updateChannel(Channel* channel){
    const int index = channel->index();
    LOG_INFO("Function=%s => fd=%d events=%d index=%d \n", __FUNCTION__, channel->fd(), channel->events(), index);

    if(index == kNew || index == kDeleted){ //channel未在poller中注册
        if(index == kNew){
            int fd = channel->fd();
            channels_[fd] = channel;
        }
        channel->set_index(kAdded);
        update(EPOLL_CTL_ADD, channel);
    }else{                                  //channel已在poller中注册
        int fd = channel->fd();
        if(channel->isNoneEvent()){ //channel没有感兴趣的事件
            update(EPOLL_CTL_DEL, channel);
            channel->set_index(kDeleted);
        }else{
            update(EPOLL_CTL_MOD, channel);
        }
    }
}
//从poller中删除channel
void EPollPoller::removeChannel(Channel* channel) {
    int fd = channel->fd();
    channels_.erase(fd); //从channel_map中删除

    LOG_INFO("Function=%s => fd=%d \n", __FUNCTION__, fd);

    int index = channel->index();
    if(index == kAdded){ //若channel在poller中注册过，也删除
        update(EPOLL_CTL_DEL, channel);
    }
    channel->set_index(kNew);
}
void EPollPoller::fillActiveChannels(int numEvents, ChannelList* activeChannels) const{
    for(int i=0; i < numEvents; ++i){
        Channel* channel = static_cast<Channel*>(events_[i].data.ptr);
        channel->set_revents(events_[i].events);
        activeChannels->push_back(channel); //EventLoop取得poller发送的发生事件的channel列表
    }
}
//更新epollpoller中channel通道 epoll_ctl add/mod/de
void EPollPoller::update(int operation, Channel* channel){
    epoll_event event;
    memset(&event, 0, sizeof(event));
    int fd = channel->fd(); 

    event.events = channel->events();
    event.data.ptr = channel;   
    event.data.fd = fd;

    if(::epoll_ctl(epollfd_, operation, fd, &event) < 0 ){ //ctl出错
        if(operation == EPOLL_CTL_DEL){
            LOG_ERROR("epoll_ctl del error:%d \n", errno);
        }else{
            LOG_FATAL("epoll_ctl add or mod error:%d \n", errno);
        }
    }
}