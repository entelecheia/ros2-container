#!/bin/bash
# this script should be executed only once when the docker container is created
source /opt/ros/foxy/setup.bash \
    && cd ~/ros2_ws \
    && colcon build \
    && . install/setup.bash
