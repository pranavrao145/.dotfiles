#!/usr/bin/env bash
selected=`cat ~/Scripts/tmux/.tmux-cht-languages ~/Scripts/tmux/.tmux-cht-commands | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/Scripts/tmux/.tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done" && tmux a
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less" && tmux a
fi

