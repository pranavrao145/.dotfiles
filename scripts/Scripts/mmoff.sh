#!/bin/bash

# script to reset wireless interfaces for regular use

# put card wlan0 into managed mode
echo "Putting interface wlan0 into managed mode..."
sudo ifconfig wlan0 down
sudo iwconfig wlan0 mode managed
sudo ifconfig wlan0 up

# start network manager
echo "Starting NetworkManager..."
sudo systemctl start NetworkManager

