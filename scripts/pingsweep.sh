#!/bin/bash

#simple ping sweep script

echo -e "Enter Your Subnet: \c"
read subnet

for ip in $(seq 1 254); do 
    ping -c 1 $subnet.$ip    
done
