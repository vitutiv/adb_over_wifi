#!/bin/bash
#echo 'Killing Server'
adb kill-server
#echo 'Staring Server'
adb start-server
#echo 'Showing devices'
#adb devices
#echo 'Getting ip address'
ip_address=`adb shell ip addr show wlan0 | grep 'inet ' | cut -d' ' -f6 | cut -d/ -f1`
#echo 'IP Address: '$ip_address
if [[ ! -z $ip_address ]]; then
	#echo 'Connecting over TCP on port 5555...'
	adb tcpip 5555
    #echo 'Connecting to $ip_address...'
    adb connect $ip_address
	if [[ $? -eq 0 && $1 == '-s' ]]; then
		#echo 'Displaying phone screen...'
		read -n 1 -s -r -p "Remove your USB cable and press any key to continue: "
		scrcpy
	fi
else
    echo 'No ip address detected. '
fi
