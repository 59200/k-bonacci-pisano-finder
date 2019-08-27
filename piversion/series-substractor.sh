#!/bin/bash

source ./families/suitestools.sh


declare -a suitea=()
declare -a suiteb=()
declare -a result=()


declare -a argsa=()
declare -a argsb=()



echo " Which is the linear recurrence family for the two series ? "
echo " 1 : fibonacci/lucas a(n)=a(n-1)+a(n-2)"
echo " 2 : padovan/perrin a(n)=a(n-2)+a(n-3)"
echo " 3 : tribonacci a(n)=a(n-1)+a(n-2)+a(n-3)"
echo " 4 : duotetranacci a(n)=a(n-3)+a(n-4)"
echo " 5 : tritetranacci a(n)=a(n-2)+a(n-3)+a(n-4)"
echo " 6 : tetranacci a(n)=a(n-1)+a(n+2)+a(n-3)+a(n-4)"
echo " 7 : duopentanacci a(n)=a(n-4)+a(n-5)"
echo " 8 : tripentanacci a(n)=a(n-3)+a(n-4)+a(n-5)"
echo " 9 : tetrapentanacci a(n)=a(n-2)+a(n-3)+a(n-4)+a(n-5)"
echo "10 : pentanacci a(n)=a(n-1)+a(n-2)+a(n-3)+a(n-4)+a(n-5)"
echo "11 : duohexanacci a(n)=a(n-5)+a(n-6)"
echo "12 : trihexanacci a(n)=a(n-4)+a(n-5)+a(n-6)"
echo "13 : tetrahexanacci a(n)=a(n-3)+a(n-4)+a(n-5)+a(n-6)"
echo "14 : pentahexanacci a(n)=a(n-2)+a(n-3)+a(n-4)+a(n-5)+a(n-6)"
echo "15 : hexanacci a(n)=a(n-1)+a(n-2)+a(n-3)+a(n-4)+a(n-5)+a(n-6)"
read -p "family : " family
echo

echo " enter initialization values for serie 1 : "
read -p "values : " -a argsa
echo
echo " enter initialization values for serie 2 : "
read -p "values : " -a argsb
echo

echo " enter number of iterations : "
read -p "iterations : " iterations

argsalength=`echo ${#argsa[@]}`
argsblength=`echo ${#argsb[@]}`
for i in `seq 0 $(($argsalength-1))`
do
suitea[$i]=`echo ${argsa[$i]}`
done
for i in `seq 0 $(($argsblength-1))`
do
suiteb[$i]=`echo ${argsb[$i]}`
done
for i in `seq 0 $(($argsalength-1))`
do
result[$i]=`echo " ${suitea[$i]} - ${suiteb[$i]} " | bc -l`
done
echo
case $family in 
	1) for i in `seq $argsalength $(($iterations-1))` ; do suitea[$i]=`summy ${suitea[$(($i-1))]} ${suitea[$(($i-2))]}` ; suiteb[$i]=`summy ${suiteb[$(($i-1))]} ${suiteb[$(($i-2))]}` ; result[$i]=`echo " ${suitea[$i]} - ${suiteb[$i]} " | bc -l` ; done ;;
	2) for i in `seq $argsalength $(($iterations-1))` ; do suitea[$i]=`summy ${suitea[$(($i-2))]} ${suitea[$(($i-3))]}` ; suiteb[$i]=`summy ${suiteb[$(($i-2))]} ${suiteb[$(($i-3))]}` ; result[$i]=`echo " ${suitea[$i]} - ${suiteb[$i]} " | bc -l` ; done ;;
	3) for i in `seq $argsalength $(($iterations-1))` ; do suitea[$i]=`summy ${suitea[$(($i-1))]} ${suitea[$(($i-2))]} ${suitea[$(($i-3))]}` ; suiteb[$i]=`summy ${suiteb[$(($i-1))]} ${suiteb[$(($i-2))]} ${suiteb[$(($i-3))]}` ; result[$i]=`echo " ${suitea[$i]} - ${suiteb[$i]} " | bc -l` ; done ;;
	4) for i in `seq $argsalength $(($iterations-1))` ; do suitea[$i]=`summy ${suitea[$(($i-3))]} ${suitea[$(($i-4))]}` ; suiteb[$i]=`summy ${suiteb[$(($i-3))]} ${suiteb[$(($i-4))]}` ; result[$i]=`echo " ${suitea[$i]} - ${suiteb[$i]} " | bc -l` ; done ;;
	5) for i in `seq $argsalength $(($iterations-1))` ; do suitea[$i]=`summy ${suitea[$(($i-2))]} ${suitea[$(($i-3))]} ${suitea[$(($i-4))]}` ; suiteb[$i]=`summy ${suiteb[$(($i-2))]} ${suiteb[$(($i-3))]} ${suiteb[$(($i-4))]}` ; result[$i]=`echo " ${suitea[$i]} - ${suiteb[$i]} " | bc -l` ; done  ;;
	6) for i in `seq $argsalength $(($iterations-1))` ; do suitea[$i]=`summy ${suitea[$(($i-1))]} ${suitea[$(($i-2))]} ${suitea[$(($i-3))]} ${suitea[$(($i-4))]}` ; suiteb[$i]=`summy ${suiteb[$(($i-1))]} ${suiteb[$(($i-2))]} ${suiteb[$(($i-3))]} ${suiteb[$(($i-4))]}` ; result[$i]=`echo " ${suitea[$i]} - ${suiteb[$i]} " | bc -l` ; done ;;
        7) for i in `seq $argsalength $(($iterations-1))` ; do suitea[$i]=`summy ${suitea[$(($i-4))]} ${suitea[$(($i-5))]}` ; suiteb[$i]=`summy ${suiteb[$(($i-4))]} ${suiteb[$(($i-5))]}` ; result[$i]=`echo " ${suitea[$i]} - ${suiteb[$i]} " | bc -l` ; done ;;
	8) for i in `seq $argsalength $(($iterations-1))` ; do suitea[$i]=`summy ${suitea[$(($i-3))]} ${suitea[$(($i-4))]} ${suitea[$(($i-5))]}` ; suiteb[$i]=`summy ${suiteb[$(($i-3))]} ${suiteb[$(($i-4))]} ${suiteb[$(($i-5))]}` ; result[$i]=`echo " ${suitea[$i]} - ${suiteb[$i]} " | bc -l` ; done ;;
	9) for i in `seq $argsalength $(($iterations-1))` ; do suitea[$i]=`summy ${suitea[$(($i-2))]} ${suitea[$(($i-3))]} ${suitea[$(($i-4))]} ${suitea[$(($i-5))]}` ; suiteb[$i]=`summy ${suiteb[$(($i-2))]} ${suiteb[$(($i-3))]} ${suiteb[$(($i-4))]} ${suiteb[$(($i-5))]}` ; result[$i]=`echo " ${suitea[$i]} - ${suiteb[$i]} " | bc -l` ; done ;;
	10) for i in `seq $argsalength $(($iterations-1))` ; do suitea[$i]=`summy ${suitea[$(($i-1))]} ${suitea[$(($i-2))]} ${suitea[$(($i-3))]} ${suitea[$(($i-4))]} ${suitea[$(($i-5))]}` ; suiteb[$i]=`summy ${suiteb[$(($i-1))]} ${suiteb[$(($i-2))]} ${suiteb[$(($i-3))]} ${suiteb[$(($i-4))]} ${suiteb[$(($i-5))]}` ; result[$i]=`echo " ${suitea[$i]} - ${suiteb[$i]} " | bc -l` ; done ;;
	11) for i in `seq $argsalength $(($iterations-1))` ; do suitea[$i]=`summy ${suitea[$(($i-5))]} ${suitea[$(($i-6))]}` ; suiteb[$i]=`summy ${suiteb[$(($i-5))]} ${suiteb[$(($i-6))]}` ; result[$i]=`echo " ${suitea[$i]} - ${suiteb[$i]} " | bc -l` ; done ;;
	12) for i in `seq $argsalength $(($iterations-1))` ; do suitea[$i]=`summy ${suitea[$(($i-4))]} ${suitea[$(($i-5))]} ${suitea[$(($i-6))]}` ; suiteb[$i]=`summy ${suiteb[$(($i-4))]} ${suiteb[$(($i-5))]} ${suiteb[$(($i-6))]}` ; result[$i]=`echo " ${suitea[$i]} - ${suiteb[$i]} " | bc -l` ; done ;;
	13) for i in `seq $argsalength $(($iterations-1))` ; do suitea[$i]=`summy ${suitea[$(($i-3))]} ${suitea[$(($i-4))]} ${suitea[$(($i-5))]} ${suitea[$(($i-6))]}` ; suiteb[$i]=`summy ${suiteb[$(($i-3))]} ${suiteb[$(($i-4))]} ${suiteb[$(($i-5))]} ${suiteb[$(($i-6))]}` ; result[$i]=`echo " ${suitea[$i]} - ${suiteb[$i]} " | bc -l` ; done ;;
	14) for i in `seq $argsalength $(($iterations-1))` ; do suitea[$i]=`summy ${suitea[$(($i-2))]} ${suitea[$(($i-3))]} ${suitea[$(($i-4))]} ${suitea[$(($i-5))]} ${suitea[$(($i-6))]}` ; suiteb[$i]=`summy ${suiteb[$(($i-2))]} ${suiteb[$(($i-3))]} ${suiteb[$(($i-4))]} ${suiteb[$(($i-5))]} ${suiteb[$(($i-6))]}` ; result[$i]=`echo " ${suitea[$i]} - ${suiteb[$i]} " | bc -l` ; done ;;
	15) for i in `seq $argsalength $(($iterations-1))` ; do suitea[$i]=`summy ${suitea[$(($i-1))]} ${suitea[$(($i-2))]} ${suitea[$(($i-3))]} ${suitea[$(($i-4))]} ${suitea[$(($i-5))]} ${suitea[$(($i-6))]}` ; suiteb[$i]=`summy ${suiteb[$(($i-1))]} ${suiteb[$(($i-2))]} ${suiteb[$(($i-3))]} ${suiteb[$(($i-4))]} ${suiteb[$(($i-5))]} ${suiteb[$(($i-6))]}` ; result[$i]=`echo " ${suitea[$i]} - ${suiteb[$i]} " | bc -l` ; done ;;
	*) echo "wrong family chosen" ;;
esac
for i in `seq 0 $iterations` ; do echo ${suitea[$i]} ${suiteb[$i]} ${result[$i]}; done
