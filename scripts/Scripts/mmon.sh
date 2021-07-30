#!/bin/bash

# script to prepare wireless interfaces for wifi cracking

# kill conflicting processes
echo "Killing all conflicting processes..."
sudo killall NetworkManager
sudo killall wpa_supplicant
sudo killall iwd

echo "Putting interface wlan0 in monitor mode..."
# put card wlan0 into monitor mode
sudo ifconfig wlan0 down
sudo iwconfig wlan0 mode monitor
sudo ifconfig wlan0 up


