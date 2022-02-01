#!/bin/bash

#Get all the files with .c/.h extension.
REQ_FILES="$(ls | grep -E '(\.h|\.c)$')" 
if [ -z $REQ_FILES ]; then
  echo "Zero files with .h or .c extension."
else
  #Extract the 'total' from the 'wc' command.
  NUM_OF_LINES="$(wc -l $REQ_FILES | grep 'total' | grep -oE '\d+')"
  echo "Total no. of lines(.h/.c): $NUM_OF_LINES"
fi

