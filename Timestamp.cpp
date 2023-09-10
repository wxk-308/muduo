#include <time.h>

#include "Timestamp.h"

Timestamp::Timestamp():microSecondsSinceEpoch_(0){}

Timestamp::Timestamp(int64_t microSecondsSinceEpoch):
    microSecondsSinceEpoch_(microSecondsSinceEpoch){}

Timestamp Timestamp::now(){
    time_t ti = time(NULL);
    return Timestamp(ti);
}
std::string Timestamp::toString() const{
    char buf[128] = {0};
    tm* time_tm = localtime(&microSecondsSinceEpoch_);
    snprintf(buf, 128, "%4d/%02d/%02d %02d:%02d:%02d", 
        time_tm->tm_year + 1900,
        time_tm->tm_mon + 1,
        time_tm->tm_mday,
        time_tm->tm_hour,
        time_tm->tm_min,
        time_tm->tm_sec);
    return buf;
} 

// #include <iostream>
// int main(){
//     std::cout << Timestamp::now().toString() << std::endl;
//     return 0;
// }