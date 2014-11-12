#!/bin/bash

# Read in a list of URLs, fetch them, and print a tab-delimted list of how long
# it took along with the URL itself.

printf "t\tURL\n"
while read line; do
    URL=$(echo "$line" | tr '\n' ' ')
    T=$({ time curl $URL > NUL ; } 2>&1 | grep real | cut -f2 -d '	')
    printf "$T\t$URL\n"
done < $1
