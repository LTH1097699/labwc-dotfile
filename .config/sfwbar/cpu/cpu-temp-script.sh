#!/usr/bin/env bash

export LANG='POSIX'
exec 2>/dev/null
# s/PATTERN/REPLACE/  change PATTERN to REPLACE
# . is any character in sed
# $ indicate end of line => 's/.$// delete any character at the end
# \{3\} replace 3 character => 's/.\{3\}$//'  replace 3 any character at the and
#CPU_TEMP=$(cat /sys/class/thermal/thermal_zone*/temp | sed 's/000$//')
#
## get temp and fan
##  awk -v l1=3 -v l2=5 'FNR == l1 {print $3$4}; FNR == l2 {print $2}'  <(sensors)
#
function cpu_temp_icon() {
  if [[ $1 -ge 80 && $1 -le 100 ]]; then echo " ${1}%°C ";
  elif [[ $1 -ge 60 && $1 -le 79 ]]; then echo " ${1}%°C ";
  elif [[ $1 -ge 40 && $1 -le 59 ]]; then echo " ${1}%°C ";
  elif [[ $1 -ge 25 && $1 -le 39 ]]; then echo " ${1}%°C ";
  else echo " ${1}%°C";
  fi
}

TEMPERATURE_DEVICE="/sys/devices/virtual/thermal/thermal_zone0"

IFS= read -r TEMP <"${TEMPERATURE_DEVICE}/temp"
cpu_temp_icon "$((TEMP/1000))"

#echo "$CPU_TEMP"

#export LANG='POSIX'
#exec 2>/dev/null
#
#TEMPERATURE_DEVICE="/sys/devices/virtual/thermal/thermal_zone0"
#
#if [ -f "${TEMPERATURE_DEVICE}/temp" ]; then
#
#    IFS= read -r TEMP <"${TEMPERATURE_DEVICE}/temp"
#
#    echo "$((TEMP/1000))˚C"
#
#else
#    echo "Invalid ${TEMPERATURE_DEVICE} interface!"
#fi
#
exit ${?}



