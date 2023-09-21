#include <arpa/inet.h>
#include <string.h>

#include "InetAddress.h"

InetAddress::InetAddress(uint16_t port, std::string ip){
    memset(&addr_, 0, sizeof(addr_)); //清零操作
    addr_.sin_family = AF_INET; //表示IPv4地址族
    addr_.sin_port = htons(port); //将端口变成网络字节序（大端模式）
    //pton文本格式转成网络字节序
    inet_pton(AF_INET, ip.c_str(), &(addr_.sin_addr)); //将ipv4地址变成网络字节序
    // addr_.sin_addr.s_addr = inet_addr(ip.c_str()) ; 被弃用
}
std::string InetAddress::toIp() const{
    char buf[64] = {0};
    inet_ntop(AF_INET, &addr_.sin_addr, buf, sizeof buf);
    return buf;
}
std::string InetAddress::toIpPort() const{
    char buf[64] = {0};
    inet_ntop(AF_INET, &addr_.sin_addr, buf, sizeof buf);
    size_t end = strlen(buf);
    uint16_t port = ntohs(addr_.sin_port); //网络字节序转成主机字节序
    sprintf(buf+end, ":%u", port);
    return buf;
}
uint16_t InetAddress::toPort() const{
    return ntohs(addr_.sin_port);
}

// #include <iostream>
// int main(){
//     InetAddress addr = InetAddress(8888);
// //     InetAddress addr(8888);
//     std::cout << addr.toIpPort() << std::endl;
//     return 0;
// }