#!/bin/bash

num1=$1
num2=$2

common_divisor() {

	local num1=$1 # setting variables that passed to function localy
	local num2=$2

	if [ $num1 -lt $num2 ]; then # setting num1 the bigger one
		temp=$num1
		num1=$num2
		num2=$temp
	fi

	while [ $(($num1%$num2)) -ne 0 ]; do # finding the gcd of num1 and num2
		temp=$num2
		num2=$(($num1 % $num2))
		num1=$temp
	done

	result=$num2 # set the result
}

common_divisor $1 $2 # calling function with two input arguments

echo "gcd of $num1 and $num2 is: $result" # printing the final result
