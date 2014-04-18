---
title: New C++11 lambda syntax
layout: post
category: howto
tags: [hightech,c++]
---
{% include JB/setup %}

After you install GCC 4.7, you’ll need to make sure it is working. Here’s a little program I use to make sure new C++11 lambda is compiled properly.

    1 // New C++11 lambda syntax
    2 #include <iostream>
    3 
    4 int main()
    5 {
    6     std::cout << "5^2 = " << [](int a) { return a*a; }(5) << std::endl;
    7     return 0;
    8 }
    9 

To compile and execute, I issue the following command:

    g++-4.7 --std=c++11 -o a cpp11-lambda.cpp && ./a
