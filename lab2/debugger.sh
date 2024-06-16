#!/usr/bin/env bash

gcc -o gen $1
gcc -o a $2
gcc -o b $3

# for i <= $4
for((i=1; i<=$4; i++)); do
    ./gen ${i} > in.txt
    ./a < in.txt > a_out.txt
    ./b < in.txt > b_out.txt
    if [[ `diff a_out.txt b_out.txt` ]]; then
        echo Test $i:
        echo Input:
        echo "--------------------"
        cat in.txt
        echo "--------------------"
        echo Output of $2:
        echo "--------------------"
        cat a_out.txt
        echo "--------------------"
        echo Output of $3:
        echo "--------------------"
        cat b_out.txt
        echo "--------------------"
        exit 1
    fi
done



