#!/bin/bash
# Name : Vikas V
# Purpose :  The function : purging() will delete the files present in folder which are certain days older
# Creation date : 10-2-2020 [dd-mm-yyy]

purging()
{
    
# Parameters defined 
InputPath=$1
InputNumberofdaysoldfile=$2 

# Checking the parameters entered from user or not
if [ -z ${InputPath} ]
then
    echo "Fail    : Path : $InputPath : Parameter is not defined "
else
    echo "Success : Path : $InputPath : Parameter is defined"
fi 

if [ -z ${InputNumberofdaysoldfile} ]
then
    echo "Fail    : Path : $InputNumberofdaysoldfile : Parameter is not defined "  
else
    echo "Success : Path : $InputNumberofdaysoldfile : Parameter is defined"
fi 

[ -d $InputPath ] > /dev/null
statuschk=$?

if [ $statuschk -eq 0 ]
then 
     echo "Purging started ..."

     find $InputPath -name "*.*" -type f -mtime +${InputNumberofdaysoldfile} -exec rm -f {} \; 

else

    echo "Entered path : $InputPath  does not exist, please enter valid path and re -run the script"

fi

}

# Note :
# in plcae of @path : enter your own path from where you want to delete files
# in place of 30 : you can pass your own number of days old files you want to delete from the path

# Parameter is passed to the function [Run script purging.sh using following command : sh purging.sh ]
purging '@path' 30

 