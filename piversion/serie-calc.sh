#!/bin/bash
source ./families/suitestools.sh
# declare array for script args, sequence calculus , modulo 3 calculus of each term of the sequence
declare -a args=( "$@" )
declare -a suite=()
declare -a modulo=()

#first terms of the sequence obtained from script parameters
for i in `seq 0 $(($#-2))`
do
suite[$i]=`echo ${args[$i]}`
done
# maximum offset for sequence calculus 
maxoffset=`echo ${args[$(($# -1))]}`

# conditionnal structure to detect the linear recurrence family 
if (( $# == 3 ))
	then 
	echo "Fibonacci/Lucas family"
	for i in `seq $(($# - 1)) $maxoffset`
		do 
		suite $i ${suite[$(($i-1))]} ${suite[$(($i-2))]}
		done
		elif (( $# == 4 ))
			then 
			echo " 1:tribonacci 2:padovan/perrin :  "
			read -p "type :" type
			case $type in
				1) echo "tribonacci family"
				     for i in `seq $(($# - 1)) $maxoffset`
					do 
					suite $i ${suite[$(($i-1))]} ${suite[$(($i-2))]} ${suite[$(($i-3))]}
					done ;;
				2) echo "padovan/perrin family"
				     for i in `seq $(($# - 1)) $maxoffset`
					do 
					suite $i ${suite[$(($i-2))]} ${suite[$(($i-3))]}
					done ;;
				*) echo "please choose in the list" ; exit 1 ;;
			esac
			elif (( $# == 5 ))
				then
				echo " 1:tetranacci 2:tritetranacci 3:duotetranacci  "
				read -p "type :" type
				case $type in
					1) echo "tetranacci family"
					     for i in `seq $(($# - 1)) $maxoffset`
						do 
						suite $i ${suite[$(($i-1))]} ${suite[$(($i-2))]} ${suite[$(($i-3))]} ${suite[$(($i-4))]}
						done ;;
					2) echo "tritetranacci family"
					     for i in `seq $(($# - 1)) $maxoffset`
						do 
						suite $i ${suite[$(($i-2))]} ${suite[$(($i-3))]} ${suite[$(($i-4))]} 
						done ;;
					3) echo "duotetranacci family"
					     for i in `seq $(($# - 1)) $maxoffset`
						do 
						suite $i ${suite[$(($i-3))]} ${suite[$(($i-4))]} 
						done ;;
					*) echo "please choose in the list" ; exit 1 ;;
				esac
				elif (( $# == 6 ))
					then
					echo "1:tripentanacci 2:tetrapentanacci 3:pentanacci 4:duopentanacci "
					read -p "type :" type
					case $type in
						1) echo "tripentanacci family"
						     for i in `seq $(($# - 1)) $maxoffset`
							do 
							suite $i ${suite[$(($i-3))]} ${suite[$(($i-4))]} ${suite[$(($i-5))]}
							done ;;
						2) echo "tetrapentanacci family"
						     for i in `seq $(($# - 1)) $maxoffset`
							do 
							suite $i ${suite[$(($i-2))]} ${suite[$(($i-3))]} ${suite[$(($i-4))]} ${suite[$(($i-5))]}
							done ;;
						3) echo "pentanacci family"
						     for i in `seq $(($# - 1)) $maxoffset`
							do 
							suite $i ${suite[$(($i-1))]} ${suite[$(($i-2))]} ${suite[$(($i-3))]} ${suite[$(($i-4))]} ${suite[$(($i-5))]}
							done ;;
						4) echo "duopentanacci family"
						     for i in `seq $(($# - 1)) $maxoffset`
							do 
							suite $i ${suite[$(($i-4))]} ${suite[$(($i-5))]}
							done ;;
						*) echo "please choose in the list" ; exit 1 ;;
					esac
					elif (( $# == 7 ))
						then
						echo "1:duohexanacci 2:trihexanacci 3:tetrahexanacci 4:pentahexanacci 5:hexanacci "
						read -p "type :" type
						case $type in
						1) echo "duohexanacci family"
							for i in `seq $(($# - 1)) $maxoffset`
                                                        do
                                                        suite $i ${suite[$(($i-5))]} ${suite[$(($i-6))]}
                                                        done ;;
						2) echo "trihexanacci family"
							for i in `seq $(($# - 1)) $maxoffset`
							do
							suite $i ${suite[$(($i-4))]} ${suite[$(($i-5))]} ${suite[$(($i-6))]}
							done;;
						3) echo "tetrahexanacci family"
							for i in `seq $(($# - 1)) $maxoffset`
                                                        do
                                                        suite $i ${suite[$(($i-3))]} ${suite[$(($i-4))]} ${suite[$(($i-5))]} ${suite[$(($i-6))]}
                                                        done ;;
						4) echo "pentahexanacci family"
							for i in `seq $(($# - 1)) $maxoffset`
                                                        do
                                                        suite $i ${suite[$(($i-2))]} ${suite[$(($i-3))]} ${suite[$(($i-4))]} ${suite[$(($i-5))]} ${suite[$(($i-6))]}
                                                        done ;;
						5) echo "hexanacci family"
							for i in `seq $(($# - 1)) $maxoffset`
                                                        do
                                                        suite $i ${suite[$(($i-1))]} ${suite[$(($i-2))]} ${suite[$(($i-3))]} ${suite[$(($i-4))]} ${suite[$(($i-5))]} ${suite[$(($i-6))]}
                                                        done ;;
						*)  echo "please choose in the list" ; exit 1 ;;
					esac
fi
# display of the sequence
echo " do you want to display sequence 1:yes 2:no : "
read -p "choix : " choix
case $choix in 
	#1) for i in `seq 0 $(($maxoffset -1 ))` ; do echo $(($i + 1)) ${suite[$i]}  `mod3 ${suite[$i]}` `psi ${suite[$i]} ${suite[$(($i-1))]}` ; modulo[$i]=`mod3 ${suite[$i]}` ;done ;;
	1) for i in `seq 0 $(($maxoffset -1 ))` ; do echo $(($i + 1)) ${suite[$i]}   ; modulo[$i]=`mod3 ${suite[$i]}` ;done ;;
	2) for i in `seq 0 $(($maxoffset -1 ))` ; do modulo[$i]=`mod3 ${suite[$i]}` ;done ;;
	*) echo "please choose in the list" ; exit 1 ;;
esac

echo

# temp files to identify the Pisano period
tmpfile='/tmp/tempmod.txt'
mathfile='/tmp/math.m'
output='/tmp/outputmodulo'

# mathematica script generation
echo  "${modulo[@]}" | sed 's/ /,/g'> $tmpfile
echo "f = Module[{b, c = 1}," > $mathfile 
echo "   While[Length[b = Union@Partition[#, c, c, {1, 1}, Take[#, c]]] > 1, c++];" >> $mathfile
echo "   {Length@First@b, First@b}] &;" >> $mathfile
echo "Print[ f@{"`cat $tmpfile`"}]" >> $mathfile
echo "Exit[]" >> $mathfile

#mathematica wrapper
./families/math.sh -noprompt -script $mathfile > $output

#cat $output | sed 's/}}/}/g' |sed 's/, \([0-9]\)/,\1/g' | cut -d" " -f 2 | sed 's/,/, /g'
# formatting of output
length=`cat $output | sed 's/, //g' |sed 's/{/ /g' | sed 's/}//g' | cut -d" " -f 2`
sequence=`cat $output | sed 's/, //g' |sed 's/{/ /g' | sed 's/}//g' | cut -d" " -f 3`
echo "Pisano period : "$sequence " of length : " $length  
echo "Constant n/n-1 = "`psi ${suite[$(($maxoffset -1))]} ${suite[$(($maxoffset - 2))]}`

#purge of temps
rm -f $tmpfile
rm -f $mathfile
rm -f $output


