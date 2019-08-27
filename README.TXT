This project goal is to identify all modulo 3 Pisano periods from a linear recurrence family :


The piversion folder contain a set of script designed to be used on raspberry pi nano computer .

The main script is pisano-periods-finder.sh :

./pisano-periods-finder.sh
choose a linear recurrence family to analyse :
 1 : fibonacci/lucas a(n)=a(n-1)+a(n-2)
 2 : padovan/perrin a(n)=a(n-2)+a(n-3)
 3 : tribonacci a(n)=a(n-1)+a(n-2)+a(n-3)
 4 : duotetranacci a(n)=a(n-3)+a(n-4)
...
...
...

choice : 1
01120221

It found the Pisano periods for a given linear recurrence family .
It also uses some subscripts :
ternarygen.sh to create a set of initialization values depending on the family chosen. 

The set of linear recurrence family subscripts:
fibonacci.sh for Fibonacci/Lucas family
padovan.sh for Padovan/Perrin family
and so on ...

each of the linear recurrence family script is used like that :
./script.sh 0 1 ... x where x is the number of iteration for the calculated sequence :

 ./tribonacci.sh 2 1 2 60
{2, 1, 2, 2, 2, 0, 1, 0, 1, 2, 0, 0, 2}

 ./fibonacci.sh 0 1 25
{0, 1, 1, 2, 0, 2, 2, 1}

each of those linear recurrence family script use a mathematica wrapper and generate 
a mathematica subscript to use with the wrapper :

tmpfile='/tmp/tempmod.txt'
mathfile='/tmp/math.m'
output='/tmp/outputmodulo'

echo  "${modulo[@]}" | sed 's/ /,/g'> $tmpfile
echo "f = Module[{b, c = 1}," > $mathfile
echo "   While[Length[b = Union@Partition[#, c, c, {1, 1}, Take[#, c]]] > 1, c++];" >> $mathfile
echo "   {Length@First@b, First@b}] &;" >> $mathfile
echo "Print[ f@{"`cat $tmpfile`"}]" >> $mathfile
echo "Exit[]" >> $mathfile

./math.sh -noprompt -script $mathfile > $output

cat $output | sed 's/}}/}/g' |sed 's/, \([0-9]\)/,\1/g' | cut -d" " -f 2 | sed 's/,/, /g'

which give the Pisano period identified in the modulo 3 array generated .

The script math.sh is a simple wrapper to the mathematica kernel of the raspberry pi 3 .
It should be adapted to run with other version (main linux version,mac osx version) 

#!/bin/bash
/opt/Wolfram/WolframEngine/10.3/Executables/MathKernel "$@"

For each linear recurrence family a set of Pisano periods is generated .
Each Pisano period in this set has a length which is a Fibonacci number or a multiple of a 
Fibonacci number .

e.g : 

for tritetranacci linear recurrence family the entire set of unique Pisano perios is :

000101122122220012101021  length 26 : 2*13
000202211211110021202012
00111201 length 8 
00222102
011022  length 6 : 2*3
01220211
12 length 2

As you can see some of Pisano periods are complementary to three ( the four firsts ) .
The others are auto-complementary , that mean they can be split in two and the two parts are 
complementary to three :
011022 : splitted in 011 022 .
01220211 : splitted in 0122 0211 .
Like the Pisano period of Fibonacci sequence : 
01120221  : splitted in 0112 0221 . 



There are some tools scripts named : 
serie-calc.sh
series-substractor.sh

serie-calc.sh calculate a serie terms and permit to display them while identifying the pisano period at the end .

./serie-calc.sh 0 1 25 , displays if chosen the 25 first term of Fibonacci serie 
./serie-calc.ch 2 1 25 , displays if chosen the 25 first terms of Lucas' Number serie 

series-substractor.sh permit to do a substraction between two series . 
It ask for initialization values for the two series , the number of wanted iterations and display them with the result on three columns.
./series-substractor.sh 
 Which is the linear recurrence family for the two series ? 
 1 : fibonacci/lucas a(n)=a(n-1)+a(n-2)
 2 : padovan/perrin a(n)=a(n-2)+a(n-3)
 3 : tribonacci a(n)=a(n-1)+a(n-2)+a(n-3)
 4 : duotetranacci a(n)=a(n-3)+a(n-4)
 5 : tritetranacci a(n)=a(n-2)+a(n-3)+a(n-4)
 6 : tetranacci a(n)=a(n-1)+a(n+2)+a(n-3)+a(n-4)
 7 : duopentanacci a(n)=a(n-4)+a(n-5)
 8 : tripentanacci a(n)=a(n-3)+a(n-4)+a(n-5)
 9 : tetrapentanacci a(n)=a(n-2)+a(n-3)+a(n-4)+a(n-5)
10 : pentanacci a(n)=a(n-1)+a(n-2)+a(n-3)+a(n-4)+a(n-5)
11 : duohexanacci a(n)=a(n-5)+a(n-6)
12 : trihexanacci a(n)=a(n-4)+a(n-5)+a(n-6)
13 : tetrahexanacci a(n)=a(n-3)+a(n-4)+a(n-5)+a(n-6)
14 : pentahexanacci a(n)=a(n-2)+a(n-3)+a(n-4)+a(n-5)+a(n-6)
15 : hexanacci a(n)=a(n-1)+a(n-2)+a(n-3)+a(n-4)+a(n-5)+a(n-6)
family : 1

 enter initialization values for serie 1 : 
values : 0 1

 enter initialization values for serie 2 : 
values : 0 2

 enter number of iterations : 
iterations : 25

0 0 0
1 2 -1
1 2 -1
2 4 -2
3 6 -3
5 10 -5
8 16 -8
13 26 -13
21 42 -21
34 68 -34
55 110 -55
89 178 -89
144 288 -144
233 466 -233
377 754 -377
610 1220 -610
987 1974 -987
1597 3194 -1597
2584 5168 -2584
4181 8362 -4181
6765 13530 -6765
10946 21892 -10946
17711 35422 -17711
28657 57314 -28657
46368 92736 -46368

