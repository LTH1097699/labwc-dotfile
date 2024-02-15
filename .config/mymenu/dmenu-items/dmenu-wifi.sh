#!/usr/bin/env bash

wifilist=$(nmcli d wifi list)

selectedwifi=$($wifilist | bemenu -l 20 >> $select1)

pass=$(bemenu -l 0)

connectname=$(echo $select1 | cut -d ' ' -f 2)

nmcli d wifi connect "$connectname" password "$pass"
