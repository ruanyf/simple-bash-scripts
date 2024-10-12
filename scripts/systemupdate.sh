#!/bin/bash

sudo apt-get update -y

if [[ $(apt list --upgradable 2>/dev/null | grep -c 'upgradable') -gt 0 ]]; then

	sudo apt-get upgrade -y

	if [[ $? -eq 0 ]]; then
		echo "*** Upgrade done successfully ***"
	else
		echo "*** Upgrade failed ***"
		exit 1
	fi

else
	echo "*** No upgrades were found ***"
fi

#After creating this bash file go to .bashrc file in the home directory to perform command alias. 
#So instead of typing the file name everytime to update, you can use any simple words
