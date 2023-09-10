#pragma once

#include <iostream>
#include <string>

class Timestamp
{
private:
    int64_t microSecondsSinceEpoch_;
public:
    Timestamp();
    explicit Timestamp(int64_t microSecondsSinceEpoch);
    static Timestamp now();
    std::string toString() const;
};


