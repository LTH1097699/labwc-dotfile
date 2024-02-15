#!/usr/bin/bash

BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)
BATTERY_CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)

battery_capacity_icon() {
  if [[ $1 -ge 80 && $1 -le 100 ]]; then BATTERY_CAPACITY="  ${1}%";
  elif [[ $1 -ge 60 && $1 -le 79 ]]; then BATTERY_CAPACITY="  ${1}%";
  elif [[ $1 -ge 30 && $1 -le 59 ]]; then BATTERY_CAPACITY="  ${1}%";
  elif [[ $1 -ge 10 && $1 -le 29 ]]; then BATTERY_CAPACITY="  ${1}%";
  else BATTERY_CAPACITY="  ${1}%" ;
  fi
}

battery_charging_icon() {
  if [[ $BATTERY_STATUS == "Discharging" ]]; then
    battery_capacity_icon "$BATTERY_CAPACITY";
  else
    BATTERY_CAPACITY="  $BATTERY_CAPACITY%";
  fi
}

battery_charging_icon "$BATTERY_STATUS"
echo "$BATTERY_CAPACITY"
