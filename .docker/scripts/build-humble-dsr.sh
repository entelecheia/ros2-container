#!/bin/bash
# Install dependencies for the Doosan Robot ROS2 package.
sudo apt-get install -y \
    libpoco-dev libyaml-cpp-dev \
    ros-humble-control-msgs \
    ros-humble-realtime-tools \
    ros-humble-xacro \
    ros-humble-joint-state-publisher-gui \
    ros-humble-ros2-control \
    ros-humble-ros2-controllers \
    ros-humble-gazebo-msgs \
    ros-humble-moveit-msgs
# shellcheck disable=SC1091
source /opt/ros/humble/setup.bash &&
    cd "${APP_WORKSPACE_DIR}" &&
    colcon build --symlink-install &&
    . install/setup.bash
