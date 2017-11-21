#!/bin/bash

TMUX_NAME="T4NEO"

tmux new-session -s $TMUX_NAME\;\
    new-window -d -n neo-cli-1 -c "/opt/neo-cli-1" "/root/neo-cli-runner.sh /opt/neo-cli-1" \;\
    new-window -d -n neo-cli-2 -c "/opt/neo-cli-2" "/root/neo-cli-runner.sh /opt/neo-cli-2" \;\
    new-window -d -n neo-cli-3 -c "/opt/neo-cli-3" "/root/neo-cli-runner.sh /opt/neo-cli-3" \;\
    new-window -d -n neo-cli-4 -c "/opt/neo-cli-4" "/root/neo-cli-runner.sh /opt/neo-cli-4" \;

tmux attach -t $sessionName
