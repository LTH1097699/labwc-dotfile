#!/usr/bin/env bash

opt1="powersave"
opt2="performance"

set_powersave() {
	
	# for checking is type sudo before
	sudo -n true
	if [[ $? != 0 ]]; then
		your_pass=$(echo | bemenu -x -l 0)
		# echo $your_pass
		sudo -S <<<"$your_pass" cpupower frequency-set -g powersave 
		
		unset your_pass
	else 
		sudo cpupower frequency-set -g powersave
	fi
	
	sudo cpupower frequency-set -u 3GHz
	echo "power" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference
}

set_performance() {
	
	# for checking is type sudo before
	sudo -n true
	if [[ $? != 0 ]]; then
		your_pass=$(echo | bemenu -x -l 0)
		# echo $your_pass
		sudo -S <<<"$your_pass" cpupower frequency-set -g performance
		
		unset your_pass
	else 
		sudo cpupower frequency-set -g performance
	fi

	sudo cpupower frequency-set -u 4GHz
	echo "performance" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference
}

selected_item=$(echo -e "$opt1\n$opt2" | bemenu -l 2)

case ${selected_item} in
    $opt1) set_powersave;;
    $opt2) set_performance;;
esac


