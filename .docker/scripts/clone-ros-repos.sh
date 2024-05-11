#!/usr/bin/env bash

# This script is used to reset the submodules in the repo to specific commits.
git clone https://github.com/doosan-robotics/doosan-robot2.git src/doosan-robot2
git clone https://github.com/ros-controls/ros2_control.git src/ros2_control
git clone https://github.com/ros-controls/ros2_controllers.git src/ros2_controllers
git clone https://github.com/ros-simulation/gazebo_ros2_control.git src/gazebo_ros2_control
git clone -b ros2 --single-branch https://github.com/ros-planning/moveit_msgs src/moveit_msgs
