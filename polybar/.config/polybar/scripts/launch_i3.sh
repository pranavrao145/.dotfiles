#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch i3bar

# launching 2 different bars on two monitors

polybar --reload i3barmon & # launching on monitor (if applicable)
polybar --reload i3barlap & # launching on laptop

# if you want to launch the same bar on all monitors

# if type "xrandr"; then
  # for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    # MONITOR=$m polybar --reload i3bar &
  # done
# else
  # polybar --reload i3bar &
# fi

echo "Bars launched..."
