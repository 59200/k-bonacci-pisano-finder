#!/bin/bash
# script to generate all ternary combinations for a linear recurrence order
declare -a ternary=()
maximum=$((3**$1-1))
for i in `seq 1 $maximum`
do
ternary[$(($i-1))]=`printf '%0'$1'd\n' $( bc <<< 'obase=3; '$i )`
done
for i in `seq 0 $(($maximum - 1))` ; do echo ${ternary[$i]} | sed 's/\(.\)/\1 /g' ; done
