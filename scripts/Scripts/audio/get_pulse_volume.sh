#!/bin/bash

echo "Vol: $(amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }') [$(amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $4 }')]"
