#!/bin/bash

###
# Variables
###
_nowDate=`date -u "+%Y%m%d-%H%M%S-%Z" | tr [A-Z] [a-z]`
_logsYum="root/logsyum"
_logFile="yum-update-$_nowDate.log"

declare _reboot
###
# END Variables requiring check
###

function func_yum_log(){
	mkdir -p /$_logsYum 2> /dev/null
	yum clean all
	yum -y update 2>&1 | tee -a /$_logsYum/$_logFile
}

function func_check_for_reboot(){
	_kernelTest=$(grep -ic  "Installing[[:blank:]]:[[:blank:]]kernel" /$_logsYum/$_logFile)
	if [ $_kernelTest -ge 1 ]; then
		echo "# Kernel updated"  | tee -a /$_logsYum/$_logFile
		_reboot="yes"
	else
		echo "# Kernel NOT updated."  | tee -a /$_logsYum/$_logFile
		_reboot="no"
	fi
}

function func_reboot(){
	if [[ $_reboot == "yes" ]]; then
		echo "Rebooting"  | tee -a /$_logsYum/$_logFile
		reboot
	else
		echo "Rebooting not required."  | tee -a /$_logsYum/$_logFile
	fi
}

func_yum_log
func_check_for_reboot
func_reboot
