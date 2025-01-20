#!/bin/bash
if ! [ -x "$(command -v convert)" ]; then
  echo 'Error: ImageMagick is not installed. Please install ImageMagick and try again.'
  exit 1
fi
for i in *.jpg; do
    convert "$i" -thumbnail 400 "thumbs/$i";
done;


