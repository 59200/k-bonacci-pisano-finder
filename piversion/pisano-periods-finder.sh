#!/bin/bash

# inits temps
tmpternaire='/tmp/tmptern'
tmpsequence='/tmp/foundsequences'


# menu
echo "choose a linear recurrence family to analyse : "
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
read -p "choice : " choice
case $choice in
	1) ./ternarygen.sh 2 > $tmpternaire ;  while read line ; do ./families/fibonacci.sh $line 20 >> $tmpsequence ; done < $tmpternaire ;;
	2) ./ternarygen.sh 3 > $tmpternaire ;  while read line ; do ./families/padovan.sh $line 50 >> $tmpsequence ; done < $tmpternaire ;;
	3) ./ternarygen.sh 3 > $tmpternaire ;  while read line ; do ./families/tribonacci.sh $line 50  >> $tmpsequence ; done < $tmpternaire ;;
	4) ./ternarygen.sh 4 > $tmpternaire ;  while read line ; do ./families/duotetranacci.sh $line 160 >> $tmpsequence ; done < $tmpternaire ;;
	5) ./ternarygen.sh 4 > $tmpternaire ;  while read line ; do ./families/tritetranacci.sh $line 160 >> $tmpsequence ; done < $tmpternaire ;;
	6) ./ternarygen.sh 4 > $tmpternaire ;  while read line ; do ./families/tetranacci.sh $line 160 >> $tmpsequence ; done < $tmpternaire ;;
	7) ./ternarygen.sh 5 > $tmpternaire ;  while read line ; do ./families/duopentanacci.sh $line 250 >> $tmpsequence ; done < $tmpternaire ;;
	8) ./ternarygen.sh 5 > $tmpternaire ;  while read line ; do ./families/tripentanacci.sh $line 230 >> $tmpsequence ; done < $tmpternaire ;;
	9) ./ternarygen.sh 5 > $tmpternaire ;  while read line ; do ./families/tetrapentanacci.sh $line 230 >> $tmpsequence ; done < $tmpternaire ;;
	10) ./ternarygen.sh 5 > $tmpternaire ;  while read line ; do ./families/pentanacci.sh $line 230 >> $tmpsequence ; done < $tmpternaire ;;
	11) ./ternarygen.sh 6 > $tmpternaire ;  while read line ; do ./families/duohexanacci.sh $line 400 >> $tmpsequence ; done < $tmpternaire ;;
	12) ./ternarygen.sh 6 > $tmpternaire ;  while read line ; do ./families/trihexanacci.sh $line 400 >> $tmpsequence ; done < $tmpternaire ;;
	13) ./ternarygen.sh 6 > $tmpternaire ;  while read line ; do ./families/tetrahexanacci.sh $line 400 >> $tmpsequence ; done < $tmpternaire ;;
	14) ./ternarygen.sh 6 > $tmpternaire ;  while read line ; do ./families/pentahexanacci.sh $line 400 >> $tmpsequence ; done < $tmpternaire ;;
	15) ./ternarygen.sh 6 > $tmpternaire ;  while read line ; do ./families/hexanacci.sh $line 1500 >> $tmpsequence ; done < $tmpternaire ;;
	*) echo " please make a choice in the list !!! " ; exit 0 ;;
esac





# declare an array with all found pisano periods
declare -a foundsequences=()

# periods formatting
final='/tmp/final'
cat $tmpsequence | sed 's/{//g' | sed 's/, //g' | sed 's/}//g' >> $final

# we fill the array with the temp file
readarray -t foundsequence < $final

# rotating array to identify unique periods
declare -A rotations
for ((i=0;i<${#foundsequence[*]};i++))
do
x=${foundsequence[i]}
[[ ${rotations[$x]:-0} -eq 0 ]] && printf "%s\n" "$x"
  for((r=0; r < ${#x}; r++))
  do
    new=${x:r}${x:0:r}
    rotations[$new]=1
  done
done

#purge temps

rm -f $tmpternaire
rm -f $tmpsequence
rm -f $final
