#pragma once

/*
继承noncopyable基类后，只能创建，不能赋值以及拷贝构造
*/
class noncopyable{
public:
    noncopyable(const noncopyable&) = delete;
    noncopyable& operator=(const noncopyable&) = delete;

protected:
    noncopyable() = default;
    ~noncopyable() = default;
};