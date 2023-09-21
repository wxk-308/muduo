#include "errno.h"
#include <sys/uio.h>
#include <unistd.h>

#include "Buffer.h"

// buffer缓冲区有大小，读取fd数据时却不知道
ssize_t Buffer::readFd(int fd, int* saveErrno){
    char extrabuf[65536] = {0}; //栈上的内存空间 64K
    struct iovec vec[2];
    
    const size_t writable = writableBytes(); //buffer剩余可写空间大小
    vec[0].iov_base = begin() + writerIndex_;
    vec[0].iov_len = writable;

    vec[1].iov_base = extrabuf;
    vec[1].iov_len = sizeof(extrabuf);
    // 设置读取后，存放数据的位置个数
    const int iovcnt = (writable < sizeof(extrabuf)) ? 2 : 1;
    const ssize_t n = ::readv(fd, vec, iovcnt);
    if(n < 0){
        (*saveErrno) = errno;
    }else if(n <= writable){ 
        writerIndex_ += n;
    }else{
        writerIndex_ = buffer_.size();
        append(extrabuf, n - writable);
    }

    return n;
}   
ssize_t Buffer::writeFd(int fd, int* saveErrno){
    ssize_t n = ::write(fd, peek(), readableBytes());
    if( n < 0 ){
        (*saveErrno) = errno;
    }
    return n;
}