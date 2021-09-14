#!/usr/bin/env bash
selected=`cat ~/Scripts/tmux/.tmux-cht-languages ~/Scripts/tmux/.tmux-cht-commands | fzf`

read -p "Enter query: " query

if grep -qs "$selected" ~/Scripts/tmux/.tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done" && tmux a
else
    tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done" && tmux a
fi
