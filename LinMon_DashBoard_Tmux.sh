#!/bin/bash


functions_script="~/LinMon/LinMon_Functions.sh"  

tmux kill-session -t linmonatul

tmux new-session -d -s linmonatul

tmux split-window -h
tmux split-window -v
tmux select-pane -t 0
tmux split-window -v
tmux select-pane -t 2
tmux split-window -v
tmux select-pane -t 4
tmux split-window -v
tmux select-pane -t 6
tmux split-window -v

tmux send-keys -t 0 "while true; do clear; source $functions_script; top_cpu; sleep 5; done" C-m
tmux send-keys -t 1 "while true; do clear; source $functions_script; top_memory; sleep 5; done" C-m
tmux send-keys -t 2 "while true; do clear; source $functions_script; network_monitor; sleep 5; done" C-m
tmux send-keys -t 3 "while true; do clear; source $functions_script; disk_usage; sleep 5; done" C-m
tmux send-keys -t 4 "while true; do clear; source $functions_script; system_load; sleep 5; done" C-m
tmux send-keys -t 5 "while true; do clear; source $functions_script; memory_usage; sleep 5; done" C-m
tmux send-keys -t 6 "while true; do clear; source $functions_script; process_monitor; sleep 5; done" C-m
tmux send-keys -t 7 "while true; do clear; source $functions_script; service_monitor; sleep 5; done" C-m


tmux attach-session -t linmonatul