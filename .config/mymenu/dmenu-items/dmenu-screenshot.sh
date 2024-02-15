#!/usr/bin/env bash

opt1=screenshoot
opt2=selectiont_area


selected_item=$(echo -e "$opt1\n$opt2" | bemenu -l 2)

# year-month-day_hour_minute:seconse:nanotime
date_time_now=$(date +"%Y-%m-%d_%H:%M:%S:%N")
file_name="Screenshots_$date_time_now.png"

# GRIM
# -t : select image type
# -g : set area (use with slurp for selection)
shot_area() {
	
	picture_dir="$HOME/Pictures/Screenshots"
	if [[ ! -d picture_dir ]]; then mkdir -p $picture_dir
	fi
	
	# save file to folder
	grim -t png -g "$(slurp)" "$picture_dir/$file_name.png"
	
	# coppy file to clipboard
	# for can past image must explitcity define -t image/png
	wl-copy -t image/png < "$picture_dir/$file_name.png"
}


case ${selected_item} in
    $opt2) shot_area;;
esac
