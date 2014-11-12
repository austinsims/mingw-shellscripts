#!/bin/bash

printf "t\tURL\n"
while read line; do
    URL=$(echo "$line" | tr '\n' ' ')
    T=$({ time curl $URL > NUL ; } 2>&1 | grep real | cut -f2 -d '	')
    printf "$T\t$URL\n"
done < $1
