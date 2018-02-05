#! /bin/bash

LAN_CARD="wlp3s0"

output=$(echo -e sudo iwlist $LAN_CARD scan | grep ESSID)
n= $( $output | wc -l)

echo -e $output

read -p "Enter choice [1-$n] " $ssid
read -p "Enter key for $ssid" $password
iwconfig $ essid $ssid key $password
