#!/bin/bash
#echo 'Killing Server'
adb kill-server
#echo 'Staring Server'
adb start-server
#echo 'Showing devices'
adb devices
#echo 'Getting ip address'
ip_address=`adb shell ip addr show wlan0 | grep 'inet ' | cut -d' ' -f6 | cut -d/ -f1`
#echo 'IP Address: '$ip_address
if [[ ! -z $ip_address ]]; then
	#echo 'Connecting over TCP on port 5555...'
	adb tcpip 5555
    #echo "Connecting to $ip_address..."
    adb connect $ip_address
else
    echo 'No ip address detected. '
fi
