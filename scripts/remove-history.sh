#!/usr/bin/env bash

echo Enter Git URL:
read varname
git clone $varname to_remove
cd to_remove
git checkout --orphan latest_branch
git add -A
git commit -am "Deleted Git History"
git branch -D master
git branch -m master
git push -f origin master
cd
rm -rf remove to_remove
