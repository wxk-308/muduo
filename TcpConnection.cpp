#include "TcpConnection.h"
#include "Logger.h"
#include "Socket.h"
#include "Channel.h"
#include "EventLoop.h"

#include <functional>
#include <errno.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <string.h>
#include <netinet/tcp.h>
#include <string>

static EventLoop* CheckLoopNotNull(EventLoop* loop){
    if(loop == nullptr){
        LOG_FATAL("%s:%s:%d mainloop is null \n",__FILE__, __FUNCTION__, __LINE__);
    }
    return loop;
}

TcpConnection::TcpConnection(EventLoop* loop,
            const std::string& nameArg,
            int sockfd,
            const InetAddress& localAddr,
            const InetAddress& peerAddr)
    : loop_(CheckLoopNotNull(loop))
    , name_(nameArg)
    , state_(kConnecting) 
    , reading_(true)
    , socket_(new Socket(sockfd))
    , channel_(new Channel(loop, sockfd))
    , localAddr_(localAddr)
    , peerAddr_(peerAddr)
    , highWaterMark_(64*1024*1024) //64M
{
    channel_->setReadCallback(std::bind(&TcpConnection::handleRead, this, std::placeholders::_1));
    channel_->setWriteCallback(std::bind(&TcpConnection::handleWrite, this));
    channel_->setCloseCallback(std::bind(&TcpConnection::handleClose, this));
    channel_->setErrorCallback(std::bind(&TcpConnection::handleError, this));

    LOG_INFO("Tcpconnection::ctor[%s] at fd=%d \n", name_.c_str(), sockfd);
    socket_->setKeepAlive(true);
}
TcpConnection::~TcpConnection(){
    LOG_INFO("Tcpconnection::dtor[%s] at fd=%d state=%d \n", name_.c_str(), channel_->fd(), (int)state_);
}

void TcpConnection::send(const std::string& buf){
    if(state_ == kConnected){
        if(loop_->isInLoopThread()){
            sendInLoop(buf.c_str(), buf.size());
        }else{
            loop_->runInLoop(std::bind(&TcpConnection::sendInLoop, this, buf.c_str(), buf.size()));
        }
    }
}
void TcpConnection::sendInLoop(const void* data, size_t len){
    ssize_t nwrote = 0;
    ssize_t remaining = len;
    bool faultError = false;
    //之前调用过connection的shutdow，不能再发送
    if(state_ == kDisconnected){
        LOG_ERROR("disconnected,give up writing \n ");
        return ;
    }
    //channel_第一次开始写数据，而且缓冲区没有待发送的数据
    if(!channel_->isWriting() && outputBuffer_.readableBytes() == 0){
        nwrote = ::write(channel_->fd(), data, len);
        if(nwrote >= 0){
            remaining = len - nwrote;
            if(remaining == 0 && writeCompleteCallback_){
                //数据在此全部发送完毕，就不再给channel设置epollout事件
                loop_->queueInLoop(std::bind(writeCompleteCallback_, shared_from_this()));
            }
        }else{
            nwrote = 0;
            if(errno != EWOULDBLOCK){
                LOG_ERROR("TcpConnection::sendInLoop()");
                if(errno == EPIPE || errno == ECONNRESET){
                    faultError = true;
                }
            }
        }
    }
    //说明当前一次write，没有把所有数据发送出去，剩余的数据需要保存到缓冲区，然后给channel
    //poller发现tcp缓冲区还有空间，会通知channel，调用writeCallback_回调
    //即调用tcpconnection handlewrite方法
    if(!faultError && remaining > 0){
        ssize_t oldLen = outputBuffer_.readableBytes();
        if(oldLen + remaining >= highWaterMark_ && oldLen < highWaterMark_ && highWaterMarkCallback_){
            loop_->queueInLoop(std::bind(highWaterMarkCallback_, shared_from_this(), oldLen+remaining));
        }
        outputBuffer_.append((char*)data + nwrote,remaining);
        if(!channel_->isWriting()){
            channel_->enableWriting();
        }
    }
}
void TcpConnection::shutdown(){
    if(state_ == kConnected){
        setState(kDisconnecting);
        loop_->runInLoop(std::bind(&TcpConnection::shutdownInLoop, this));
    }
}
void TcpConnection::shutdownInLoop(){
    if(!channel_->isWriting()){ //说明outputbuffer缓冲区数据全部发送完
        socket_->shutdownWrite(); //关闭写端
    }
}
//连接建立
void TcpConnection::connectEstablished(){
    setState(kConnected);
    channel_->tie(shared_from_this());
    channel_->enableReading(); //向poller注册channel的epollin事件

    //新连接建立，执行回调
    connectionCallback_(shared_from_this());
}   
//连接销毁
void TcpConnection::connectDestroyed(){
    if(state_ == kConnected){
        setState(kDisconnected);
        channel_->disableAll(); //把channel中的所有感兴趣事件，从poller中del掉
        connectionCallback_(shared_from_this());
    }
    channel_->remove(); //把channel从poller中删除
}

void TcpConnection::handleRead(Timestamp receiveTime){
    int saveErrno = 0;
    ssize_t n = inputBuffer_.readFd(channel_->fd(), &saveErrno);
    if(n > 0){
        //有可读事件发生，调用相应的回调函数
        messageCallback_(shared_from_this(), &inputBuffer_, receiveTime);
    }else if( n ==0 ){
        handleClose();
    }else{
        errno = saveErrno;
        LOG_ERROR("Tcpconnection::handleRead \n");
        handleError();
    }
}
void TcpConnection::handleWrite(){
    if(channel_->isWriting()){
        int savedErrno = 0;
        ssize_t n = outputBuffer_.writeFd(channel_->fd(), &savedErrno);
        if(n > 0){
            outputBuffer_.retrieve(n);
            if(outputBuffer_.readableBytes() == 0){
                channel_->disableWriting();
                if(writeCompleteCallback_){
                    loop_->queueInLoop(std::bind(writeCompleteCallback_, shared_from_this()));
                }
                if(state_ == kDisconnecting){
                    shutdownInLoop();
                }
            }
        }else{
            LOG_ERROR("Tcpconnection::handleWrite errno \n");
        }
    }else{
        LOG_ERROR("Tcpconnection fd=%d is down, no more writing\n", channel_->fd());
    }
}
void TcpConnection::handleClose(){
    LOG_INFO("fd=%d state=%d \n", channel_->fd(), (int)state_);
    setState(kDisconnected);
    channel_->disableAll();
    TcpConnectionPtr connPtr(shared_from_this());
    connectionCallback_(connPtr); //执行连接关闭 回调
    closeCallback_(connPtr); //关闭连接回调
}
void TcpConnection::handleError(){
    int optval;
    socklen_t optlen = sizeof(optval);
    int err = 0;
    if(::getsockopt(channel_->fd(), SOL_SOCKET, SO_ERROR, &optval, &optlen) < 0){ 
        err = errno;
    }else{
        err = optval;
    }
    LOG_ERROR("Tcpconnection::handleError name %s - SO_ERROR:%d \n ", name_.c_str(), err);
}

