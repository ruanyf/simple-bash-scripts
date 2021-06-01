#!/bin/bash

#===============================================================================
RED="\e[0;31m"
GREEN="\e[0;32m"
YELLOW="\e[0;33m"
CYAN="\e[0;36m"
BLUE="\e[0;34m"
BACK="\e[0m"

#===============================================================================

fail() {
    echo -e "${RED}  FAIL  ${BACK}:" "$@" >&2
}

# Check that we're running on Linux
if [ -e /usr/sbin/system_profiler ] ; then
	fail "This script doesn't support MacOS"
	echo "Please run this script on Linux"
	exit 0

elif grep -qi microsoft /proc/version ; then
	fail "This script doesn't support Windows"
	echo "Please run this script on Linux"
	exit 0

elif [ $(uname -s) != Linux ] ; then
	fail "This script doesn't support $(uname -s)"

else
	echo "-------------------------------System Information----------------------------"
	echo "Hostname:\t\t"$(hostname)
	echo "uptime:\t\t\t"`uptime | awk '{print $3,$4}' | sed 's/,//'`
	echo "Manufacturer:\t\t"`cat /sys/class/dmi/id/chassis_vendor`
	echo "Product Name:\t\t"`cat /sys/class/dmi/id/product_name`
	#echo "Version:\t\t"`cat /sys/class/dmi/id/product_version`
	#echo "Serial Number:\t\t"`cat /sys/class/dmi/id/product_serial`
	echo "Machine Type:\t\t"`vserver=$(lscpu | grep Hypervisor | wc -l); if [ $vserver -gt 0 ]; then echo "VM"; else echo "Physical"; fi`
	echo "Operating System:\t"`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
	echo "Kernel:\t\t\t"`uname -r`
	echo "Architecture:\t\t"`arch`
	echo "Processor Name:\t\t"`awk -F':' '/^model name/ {print $2}' /proc/cpuinfo | uniq | sed -e 's/^[ \t]*//'`
	echo "Active User:\t\t"`w | cut -d ' ' -f1 | grep -v USER | xargs -n1`
	echo "System Main IP:\t\t"`hostname -I`
	echo ""
	echo "-------------------------------CPU/Memory Usage------------------------------"
	echo "Memory Usage:\t"`free | awk '/Mem/{printf("%.2f%"), $3/$2*100}'`
	echo "Swap Usage:\t"`free | awk '/Swap/{printf("%.2f%"), $3/$2*100}'`
	echo "CPU Usage:\t"`cat /proc/stat | awk '/cpu/{printf("%.2f%\n"), ($2+$4)*100/($2+$4+$5)}' |  awk '{print $0}' | head -1`
	echo ""
	echo "-------------------------------Disk Usage >80%-------------------------------"
	df -Ph | sed s/%//g | awk '{ if($5 > 80) print $0;}'
	echo ""
fi

exit 0

