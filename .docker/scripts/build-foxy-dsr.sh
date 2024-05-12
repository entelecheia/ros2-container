#!/bin/bash
# Install dependencies for the Doosan Robot ROS2 package.
sudo apt-get install -y \
    ros-foxy-control-msgs \
    ros-foxy-realtime-tools \
    ros-foxy-xacro \
    ros-foxy-joint-state-publisher-gui \
    ros-foxy-object-recognition-msgs \
    ros-foxy-octomap-msgs \
    ros-foxy-gazebo-ros \
    ros-foxy-gazebo-ros-pkgs \
    ros-foxy-control-toolbox \
    ros-foxy-eigen-stl-containers
# shellcheck disable=SC1091
source /opt/ros/foxy/setup.bash &&
    cd "${APP_WORKSPACE_DIR}" &&
    colcon build --symlink-install --allow-overriding controller_interface hardware_interface &&
    . install/setup.bash
