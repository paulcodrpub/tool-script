#!/bin/bash
# What does it do?
# When I execute lb.sh on my Mac, it creates a .md file in 
# ~/Documents/logbook/yyyy-mm-dd.md, and vim editor opens the .md file. 
# If the folder is not there, it will be created. The goal was to remove 
# as much friction as possible.
# This script was tested on CentOS and Mac.

# Please review lb.md for more details.


###
# Variables
###
declare _logdir;

### Timezone
# Only one timezone should be UNcommented out.
_timezone="America/Los_Angeles"
#
# _timezone="Etc/UTC"    # usually used on servers
#
# I use variable _timezone to ensure that logs created even on computers set
# to UTC timezone will use human readable time 
# (date/time stamp of your location) in logs.
#
# From https://en.wikipedia.org/wiki/List_of_tz_database_time_zones


# ex: 2019-02-09 21hr Saturday
_dateHourWeekday=$(TZ=":${_timezone}" date '+%Y-%m-%d %Hhr %A')

# ex: 2019-02-09.md
_dateFilename=`echo ${_dateHourWeekday} | awk '{print $1}'`.md

# ex: 2019-02-09 21hr
_dateHour=`echo ${_dateHourWeekday} | awk '{print $1" "$2}'`

# ex: Saturday
_dateWeekday=`echo ${_dateHourWeekday} | awk '{print $3}'`

# ex: 21hr
_dateHourOnly=`echo ${_dateHourWeekday} | awk '{print $2}'`
###
# END of Variables
###

function func-create-dir(){
  if [ -d $HOME/Documents ] && [ ! -d $HOME/Documents/logbook ]; then
    _logdir=$HOME/Documents/logbook
    mkdir $_logdir 
  elif [ -d $HOME/Documents ] && [ $HOME/Documents/logbook ]; then
    _logdir=$HOME/Documents/logbook
  elif [ ! -d $HOME/logbook ]; then  
    _logdir=$HOME/logbook
    mkdir $_logdir   
  else 
    _logdir=$HOME/logbook
  fi
}

function func-timestamp(){
  if [[ ! -f ${_logdir}/${_dateFilename} ]]; then
    echo -e "# ${_dateHourWeekday}\n" >> ${_logdir}/${_dateFilename}
  elif grep -q "${_dateHourOnly}" ${_logdir}/${_dateFilename}; then
    echo -e "\n" >> ${_logdir}/${_dateFilename}
  else
    echo -e "\n# ${_dateHour}\n" >> ${_logdir}/${_dateFilename}
  fi
}


function func-lb(){
    # Open the file in vim and move to bottom of the file.
    vim +999 ${_logdir}/${_dateFilename}
}

func-create-dir
func-timestamp
func-lb
