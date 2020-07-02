#!/usr/bin/env bash

temp=$(cat /sys/devices/platform/it87.2608/hwmon/hwmon3/temp1_input | cut -c -2)

if [ $temp -ge 20 -a $temp -lt 35 ];then
    echo 🌡 %{F#e6db74}"$temp"°C%{F-}
    
elif [ $temp -ge 35 -a $temp -lt 50 ];then
    echo 🔥 %{F#fdbc4b}"$temp"°C%{F-}
    
elif [ $temp -ge 50 ];then
    echo 🔥 %{F#0095ff}"$temp"°C%{F-}
    
fi
