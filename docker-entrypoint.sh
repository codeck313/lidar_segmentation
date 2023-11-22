#!/bin/bash

# exit immediately if a command exits with a non-zero status (see `$ help set`)
set -e

ECHO_PREFIX="[docker-entrypoint.sh]"

# location of master
# export ROS_MASTER_URI=http://absolute:11311/
# echo "$ECHO_PREFIX" "set ROS master: " "$ROS_MASTER_URI"
export ROS_HOSTNAME=localhost
export ROS_MASTER_URI=http://localhost:11311

#tmux file values
echo -e "setw -g mouse on \n set -g mouse-select-pane on \n set -g mouse-resize-pane on \n set -g mouse-select-window on" >> ~/.tmux.config

# ROS installation
ROS=/opt/ros/noetic/setup.bash
source "$ROS"
echo "$ECHO_PREFIX" "sourced ROS installation:" "$ROS"

echo -e "function sdsd \n { \n current_path=`pwd` \n worskpace='_ws' \n source devel/setup.bash \n }" >> ~/.bashrc
source ~/.bashrc

# workspace holding custom ROS packages
workspace=/catkin_ws
source "$workspace"/devel/setup.bash
echo "$ECHO_PREFIX" "sourced workspace:" "$workspace"

echo "$ECHO_PREFIX" "call" "$@"
exec "$@"
