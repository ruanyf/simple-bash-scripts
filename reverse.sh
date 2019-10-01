count=0
array=()
for i in $*
    do
    count=$((count+1))
    array+=($i)
done
echo ${array[@]}
for ((i=$count-1;i>=0;i--))
  do
      echo -n "${array[i]} "
done
