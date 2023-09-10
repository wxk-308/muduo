cmake_minimum_required(VERSION 3.10)
project(Mymuduo)

#设置编译完后存放路径
set(LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)
#设置调试信息 and 启动c++11标准
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -std=c++11")
#定义参加编译的源文件  
aux_source_directory(. src)
#编译生成动态库Mymuduo
add_library(Mymuduo SHARED ${src})