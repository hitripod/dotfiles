#!/bin/sh 
tmux new-session -d 'vim -c "NERDTreeToggle"'
tmux split-window -v -p 15 
tmux -2 attach-session -d 
