#!/bin/sh

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT=$(xrdb -query | grep "*color14" | cut -f 2)
TEXT=$(xrdb -query | grep "*color14" | cut -f 2)
WRONG='#880000bb'
VERIFYING=$(xrdb -query | grep "*color14" | cut -f 2)

i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--screen 1                   \
--blur 5                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %m %Y"       \
--keylayout 1                \
--radius 250                 \
--time-font "JetBrainsMonoMedium Nerd Font Mono" \
--date-font "JetBrainsMonoMedium Nerd Font Mono" \
--layout-font "JetBrainsMonoMedium Nerd Font Mono" \
--verif-font "JetBrainsMonoMedium Nerd Font Mono" \
--wrong-font "JetBrainsMonoMedium Nerd Font Mono" \
--greeter-font "JetBrainsMonoMedium Nerd Font Mono" \
