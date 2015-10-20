#!/bin/sh
if [ "$#" -lt 3 ]; then
    echo "Not enough parameters!"
fi
if [ "$#" -gt 3 ]; then
    echo "Too many parameters!"
fi
if [ "$#" -eq 3 ]; then
    if [ "$1" -ge "$2" -a "$1" -ge "$3" ]; then
        echo $1" is the largest number."
    fi
    if [ "$2" -ge "$1" -a "$2" -ge "$3" ]; then
        echo $2" is the largest number."
    fi
    if [ "$1" -le "$3" -a "$2" -le "$3" ]; then
        echo $3" is the largest number."
    fi
fi

