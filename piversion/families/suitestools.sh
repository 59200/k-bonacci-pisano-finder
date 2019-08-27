#!/bin/bash
# function to sum anything used in parameter
summy()
{
echo $* | sed 's/ /+/g' | bc -l
}
#function to store sequences calculus
suite()
{
local o=$1
if (( $# == 3 ))
then
	suite[$o]=`summy $2 $3`
	elif (( $# == 4 ))
	then 
		suite[$o]=`summy $2 $3 $4`
		elif (( $# == 5 ))
		then
			suite[$o]=`summy $2 $3 $4 $5`
			elif (( $# == 6 ))
			then
				suite[$o]=`summy $2 $3 $4 $5 $6`
				elif (( $# == 7 ))
				then
					suite[$o]=`summy $2 $3 $4 $5 $6 $7`	
fi	
}

# function to calculate modulo 3 reduction of sequences terms
mod3()
{
echo "scale=0; $1 % 3 " | bc -l 
}
# function divide used to calculate constant n/n-1
psi()
{
echo " $1 / $2 " | bc -l
}
