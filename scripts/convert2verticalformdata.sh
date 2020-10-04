# Name       : Vikas V
# Purpose    : convert specific pipe separated row-data to vertical format data 

sed '2!d' /f/filename.txt | tr '|' '\n' > /f/Output.txt


