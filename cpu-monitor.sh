#!/bin/bash
#Simple RaspberryPi CPU status monitoring script
#Available CPU params: core temperature, core voltage
#Don`t forget to chmod +x cpu-monitor.sh
#To make script available as standard Linux command just copy it to /usr/bin

divider=======================
divider=$divider$divider

header="\n %-9s %10s %12s\n"
format="%-7s %10s %14s\n"
width=36

printf "$header" "TIME" "CORE TEMP(C)" "CORE VOLTAGE"
printf "%$width.${width}s\n" "$divider"

while true
do
	core_temp=$(vcgencmd measure_temp | grep -o "[0-9]*\.[0-9]*") #grep only numbers from temp=0.0
	core_volts=$(vcgencmd measure_volts | grep -o "[0-9*\.[0-9]*") #grep only numbers  from volt=0.0
	current_time=$(date +"%T")
	printf "$format" "$current_time" "$core_temp" "$core_volts"
	sleep 2  
done
