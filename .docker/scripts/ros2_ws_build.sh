#!/bin/bash
# this script should be executed only once when the docker container is created
# shellcheck disable=SC1091
source /opt/ros/foxy/setup.bash &&
    cd /home/$USERNAME/$APP_DIRNAME &&
    colcon build --symlink-install &&
    . install/setup.bash
