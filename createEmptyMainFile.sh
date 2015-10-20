#!/bin/sh
if [ -e main.cc ]
    then
        rm main.cc
fi
touch main.cc
cat joel_861238902.txt >> main.cc
echo  >> main.cc
echo "    int main(int argc, const char** argv)" >> main.cc
echo "        {}" >> main.cc
