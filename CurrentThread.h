#pragma once
#include <unistd.h>
#include <sys/syscall.h>

namespace CurrentThread {
    extern __thread int t_cachedTid;
    void cacheTid();

    inline int tid(){ //内联函数适合于短小的、频繁调用的函数
        if(__builtin_expect(t_cachedTid==0, 0)){ //表示t_cachedTid==0为假的可能性更大
            cacheTid();
        }
        return t_cachedTid;
    }
}