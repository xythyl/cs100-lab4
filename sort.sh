#!/bin/sh
NUM=(4 8 10 2 5 1)
echo "original number set"
echo ${NUM[*]}
new_num=($(echo "${NUM[*]}" | sed 's/ /\n/g' | sort -n))
echo "sorted number set"
echo ${new_num[*]}
