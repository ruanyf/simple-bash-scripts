#!/usr/bin/env bash
name=$1
path=$2
tar -czvf "$name.tar.gz" "$path"
gpg -c "$name.tar.gz"
rm -rf "$name.tar.gz"

// decrypt and untar  ==> gpg --decrypt $name.tar.gz.gpg | tar -xvzf -
