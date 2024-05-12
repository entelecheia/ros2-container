#!/bin/bash
# Install dependencies for the Doosan Robot ROS2 package.
sudo apt-get install -y \
    ros-foxy-gazebo-ros-pkgs \
    ros-foxy-control-toolbox \
    ros-foxy-octomap-msgs \
    ros-foxy-object-recognition-msgs \
    ros-foxy-control-msgs \
    ros-foxy-eigen-stl-containers
# shellcheck disable=SC1091
source /opt/ros/foxy/setup.bash &&
    cd "${APP_WORKSPACE_DIR}" &&
    colcon build --symlink-install --allow-overriding controller_interface hardware_interface &&
    . install/setup.bash
