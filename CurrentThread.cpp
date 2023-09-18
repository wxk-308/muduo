#include "CurrentThread.h"
#include <sys/syscall.h>

namespace CurrentThead{
    __thread int t_cachedTid = 0;
    void cacheTid(){
        if(t_cachedTid == 0){
            //用 ::syscall(SYS_gettid) 来获取当前线程的线程ID（TID），
            //然后将其强制转换为 pid_t 类型
            t_cachedTid = static_cast<pid_t>(::syscall(SYS_gettid));
        }
    }
}