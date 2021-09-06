#!/bin/bash

echo -e "enter name of fole to check: \c" 
read -r file_name  

if [ -e "$file_name" ]; then       
    echo "$file_name found"        
else                               
    echo "$file_name not found"    
fi                                  

#Notes for file testing:
# -e is use to check file existence
# -d is used to check directory existence
# -f is used to check if file exists and if it is a regular file
# -s is used to check if file is empty or not
# -r for read permissions , -w for write permissions and -x for executable permissions.
