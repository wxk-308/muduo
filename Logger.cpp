#pragma once

#include <iostream>

#include "Logger.h"
#include "Timestamp.h"

Logger& Logger::instance(){
    static Logger logger;
    return logger;
}

void Logger::setLogLevel(int level){
    loglevel_ = level;
}

//控制台输出格式【级别信息】 time ：msg
void Logger::log(std::string msg){
    switch (loglevel_)
    {
    case INFO:
        std::cout << "[INFO] ";
        break;
    case ERROR:
        std::cout << "[ERROR] ";
        break;
    case FATAL:
        std::cout << "[FATAL] ";
        break;
    case DEBUG:
        std::cout << "[DEBUG] ";
        break;
    default:
        break;
    }

    std::cout << Timestamp::now().toString() << ":" << msg << std::endl;
}