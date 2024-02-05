#!/usr/bin/env bash

arr=('-' '\' '|' '/')
function affect(){
    while true; do
        for c in "${arr[@]}"; do
            echo -en "\r $c "
            sleep 0.5
        done
    done
}

echo 'loading'
affect
