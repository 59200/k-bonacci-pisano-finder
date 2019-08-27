#!/bin/bash

#vars : we get two sequences in parameter
sequence1=$1
sequence2=$2

# temp script for mathematica
tmpmath='/tmp/compare.m'

#script generation

echo "areListsEqual[List1_, List2_] := (Sort[List1] === Sort[List2]);" > $tmpmath
echo "Print[areListsEqual["$1","$2"]]" >> $tmpmath
echo "Exit[]" >> $tmpmath

# mathematica run
./math.sh -noprompt -script $tmpmath

rm -f $tmpmath
