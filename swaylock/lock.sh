#!/bin/sh

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT=$(cat ~/.cache/wal/colors-kitty.conf | grep -m 1 color10 | awk '{print $2}')
TEXT=$(cat ~/.cache/wal/colors-kitty.conf | grep -m 1 color10 | awk '{print $2}')
WRONG='#880000bb'
VERIFYING=$(cat ~/.cache/wal/colors-kitty.conf | grep -m 1 color10 | awk '{print $2}')

swaylock \
    --daemonize \
    --inside-ver-color=$CLEAR \
    --ring-ver-color=$VERIFYING \
    --inside-wrong-color=$CLEAR \
    --ring-wrong-color=$WRONG \
    --inside-color=$BLANK \
    --ring-color=$DEFAULT \
    --line-color=$BLANK \
    --separator-color=$DEFAULT \
    --text-ver-color=$TEXT \
    --text-wrong-color=$TEXT \
    --layout-text-color=$TEXT \
    --key-hl-color=$WRONG \
    --bs-hl-color=$WRONG \
    --screen \
    --effect-blur 5x5 \
    --effect-vignette 0.5:0.5 \
    --clock \
    --indicator \
    --timestr="%H:%M:%S" \
    --datestr="%A, %m %Y" \
    --indicator-radius 250 \
    --font "JetBrainsMono Nerd Font Mono" \
