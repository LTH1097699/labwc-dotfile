#!/usr/bin/env bash

opt1="enabled"
opt2="disabled"

selected_item=$(echo -e "$opt1\n$opt2" | bemenu -l 2)

case ${selected_item} in
    $opt1) warp-cli connect;;
    $opt2) warp-cli disconnect;;
esac
