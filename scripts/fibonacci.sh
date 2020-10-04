#!/usr/bin/env bash

echo -n "Enter the integer you would like to test. If you enter 0, I will print the sequence: "
read a

x=0; y=1

if [[ $a -eq 0 ]]
  then
    echo -n "$x "; sleep .5
    echo -n "$y "; sleep .5
    while true; do
	z=$((x + y))
	echo -n "$z "
	x=$y
	y=$z
	sleep .5
    done 
  else
    while [[ a -ge y ]]; do
  	if [[ $a -eq $y ]] ; then echo "$a is a fibonacci number!" ; exit 0 ; fi
	z=$((x + y))
	x=$y
	y=$z
    done
    echo "$a is not a fibonacci number, sorry."
fi
