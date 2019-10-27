#!/bin/bash

for i in $(find . -name "gradlew" -type f -prune)
do (
  cd $(dirname $(realpath $i));
  pwd
  ./gradlew clean
  rm -rf ../node_modules/
)
done
