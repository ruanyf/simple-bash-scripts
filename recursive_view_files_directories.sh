#!/bin/bash
echo "<html>" > q14.htm
echo "<body>" >> q14.htm
echo "<table width='80%' style="th {background-color: red}" border=1>" >> q14.htm
echo "<tr><th colspan='3'>Home</th></tr>" >> q14.htm
echo "<tr><th>Name</th>" >> q14.htm
echo "<th>Size</th>" >> q14.htm
echo "<th>Type</th></tr>" >> q14.htm
IFS=$'\n'
for i in `ls -Rl | grep -e "./" -e "-"`
do
	if [[ "$i" = ./* ]]
	then
		x=`echo $i | tr -s "\./" '\0' | tr -s ':' '\0' | tr -s '\0' '/'`
		echo "<tr><th colspan='3'>$x</th></tr>" >> q14.htm
		echo "<tr><th>Name</th>" >> q14.htm
                echo "<th>Size</th>" >> q14.htm
                echo "<th>Type</th></tr>" >> q14.htm
	elif [[ "$i" = -* ]]
        then
                x=`echo $i | tr -s ' ' | cut -d" " -f 9`
                echo "<tr><td>$x</td>" >> q14.htm
		x=`echo $i | tr -s ' ' | cut -d" " -f 5`
		echo "<td>$x</td>" >> q14.htm
		echo "<td>File</td></tr>" >> q14.htm
	elif [[ "$i" = d* ]]
        then
                x=`echo $i | tr -s ' ' | cut -d" " -f 9`
                echo "<tr><td>$x</td>" >> q14.htm
		x=`echo $i | tr -s ' ' | cut -d" " -f 5`
                echo "<td>$x</td>" >> q14.htm
                echo "<td>Directory</td></tr>" >> q14.htm
	fi
done

echo "</table>" >> q14.htm
echo "</body>" >> q14.htm
echo "</html>" >> q14.ht