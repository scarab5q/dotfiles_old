#!/usr/bin/env sh 

windows=$(tmux list-windows )  

selected_window=$(tmux list-windows | awk '{print $1 " " $2}' | fzf-tmux | xargs echo )

if [ -z "$selected_window" ]; then
    echo $selected_window
else
    echo "no window"
fi

