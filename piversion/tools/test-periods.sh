#!/bin/bash

compare='/tmp/result'
./compare.sh "$1" "$2" > $compare


if  grep -q True "$compare"
then
echo 0 
else
echo 1
fi


rm -f $compare
