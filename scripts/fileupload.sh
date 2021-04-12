#!/usr/bin/env bash
# fileupload.sh
# Copyright 2021 - Opensouce
# https://www.file.io/plans
# Manage your files in "My Files"
# Share files up to 100 MB
# API rate limit: 1 request/minute
# Files auto-deleted after 1 download


URL="https://file.io"
DEFAULT_EXPIRE="14d"

if [ $# -eq 0 ]; then
    echo "Usage: file.io.sh FILE/FILE_PATH [DURATION: 1w]"
    exit 1
fi

FILE=$1
DURATION=${2:-$DEFAULT_EXPIRE}

uploadfile() {
    local cmd response RESPONSE RED="" NC=""
    for cmd in jq curl; do
        if ! command -v "$cmd" &> /dev/null
        then
            echo -e "${RED}COMMAND: $cmd not found${NC}"
            echo "Install using your package manager"
            return 1
        fi
    done

    response="$( curl -F "file=@${FILE}" "${URL}/?expires=${DURATION}" 2>/dev/null )"

    if [[ $response == *'"success":true'* ]]; then
        IFS=$'\n' RESPONSE=($(jq -r --compact-output '.link,.name,.expires,.size' <<< "$response" ))
        printf "Link: %s \nName: %s \nExpires: %s \nSize: %s \n" "${RESPONSE[@]}"
    else
        echo "${RED}Error: ${response}${NC}"
    fi
}

uploadfile
