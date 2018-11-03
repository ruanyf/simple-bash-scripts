#!/bin/bash

TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED_B='\e[1;31m'

sudo apt-get update
echo -e $TEXT_YELLOW
echo 'APT update finished...'
echo -e $TEXT_RESET

sudo apt-get dist-upgrade -y
echo -e $TEXT_YELLOW
echo 'APT distributive upgrade finished...'
echo -e $TEXT_RESET

sudo apt-get upgrade -y
echo -e $TEXT_YELLOW
echo 'APT upgrade finished...'
echo -e $TEXT_RESET

sudo apt-get autoremove -y
echo -e $TEXT_YELLOW
echo 'APT auto remove finished...'
echo -e $TEXT_RESET

sudo apt-get autoclean -y
echo -e $TEXT_YELLOW
echo 'APT auto clean finished...'
echo -e $TEXT_RESET

sudo apt-get remove -y
echo -e $TEXT_YELLOW
echo 'APT remove finished...'
echo -e $TEXT_RESET

sudo apt-get clean -y
echo -e $TEXT_YELLOW
echo 'APT clean finished...'
echo -e $TEXT_RESET

if [ -f /var/run/reboot-required ]; then
    echo -e $TEXT_RED_B
    echo 'Reboot required!'
    echo -e $TEXT_RESET
fi
