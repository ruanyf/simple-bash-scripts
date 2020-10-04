# Name       : Vikas V
# Purpose    : Convert specific row pipe separated data to vertical format data

sed '2!d' /f/filename.txt | tr '|' '\n' > /f/Output.txt