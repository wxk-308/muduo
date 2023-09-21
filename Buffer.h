#pragma once

#include <vector>
#include <string>

///+--------------+--------------+---------------+
///| prependable  |  readable    |  writeable    |
///|  bytes       |    bytes     |    bytes      |
///+--------------+--------------+---------------+
/// 0 <= readerIndex <= writerIndex <= size 
 
//网络库底层的缓冲器类型定义
class Buffer{
public:
    static const size_t kCheapPrepend = 8; //prependable长度
    static const size_t kInitialSize = 1024; //缓冲区起始大小 包括read和write大小

    explicit Buffer(size_t initialSize = kInitialSize)
        : buffer_(kCheapPrepend + initialSize)
        , readerIndex_(kCheapPrepend)
        , writerIndex_(kCheapPrepend)
    {}
    size_t readableBytes() const{ return writerIndex_ - readerIndex_; }
    size_t writableBytes() const { return buffer_.size() - writerIndex_; }
    size_t prependableBytes() const { return readerIndex_; }
    
    //返回缓冲区中可读数据的起始地址
    const char* peek() const{ return begin() + readerIndex_; }

    void retrieve(size_t len){ 
        if(len < readableBytes()){ //正常情况下，不会执行
            readerIndex_ += len; //缓冲区只读了一部分
        }else{
            retrieveAll();
        }
    }
    void retrieveAll(){ 
        readerIndex_ = writerIndex_ = kCheapPrepend;
    }
    //buffer转成string
    std::string retrieveAllAsString(){ return retrieveAsString(readableBytes()); }
    std::string retrieveAsString(size_t len){ 
        std::string result(peek(), len); //读取buffer中可读取的数据
        retrieve(len); //对缓冲区进行复位操作
        return result;
    }

    void ensureWriteableBytes(size_t len){
        if(writableBytes() < len){
            makeSpace(len); //扩容函数
        }
    }
    //把data内存上的数据添加到writeable缓冲区当中
    void append(const char* data, size_t len){
        ensureWriteableBytes(len);
        std::copy(data, data+len, beginWrite());
        writerIndex_ += len;
    }
    char* beginWrite() { return begin() + writerIndex_; }
    const char* beginWrite() const { return begin() + writerIndex_; }
    //从fd中读取数据
    ssize_t readFd(int fd, int* saveErrno);
    //从fd发送数据
    ssize_t writeFd(int fd, int* saveErrno);
private:
    char* begin(){ return &*buffer_.begin(); }
    const char* begin() const { return &*buffer_.begin(); }

    void makeSpace(size_t len){
        // 可写长度+前面空闲长度  < 8字节固定空闲长度 + len（想写入的长度）
        if(writableBytes() + prependableBytes() < len + kCheapPrepend){
            buffer_.resize(writerIndex_ + len);
        }else{
            size_t readable = readableBytes(); 
            //将可读取数据前移 到kCheapPrepend指针位置（第8个字节起始位置）
            std::copy(begin() + readerIndex_, begin() + writerIndex_, begin()+kCheapPrepend);
            readerIndex_ = kCheapPrepend;
            writerIndex_ = kCheapPrepend + readable;
            // readerIndex_ = kCheapPrepend;
        }
    }    

    std::vector<char> buffer_;
    size_t readerIndex_;
    size_t writerIndex_;
};