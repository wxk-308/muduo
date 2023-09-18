#！/bin/bash

set -e

#如果没有build目录，创建
if [ ! -d `pwd`/build ]; then
    mkdir `pwd`/build
fi

rm -rf `pwd`/build/*

cd `pwd`/build && cmake .. && make

cd ..

#把头文件拷贝到/usr/include/mymuduo so库拷贝到/usr/lib
if [ ! -d /usr/include/Mymuduo ]; then
    mkdir /usr/include/Mymuduo
fi

for header in `ls *.h`
do
    cp $header /usr/include/Mymuduo
done

cp `pwd`/lib/libMymuduo.so /usr/lib

ldconfig