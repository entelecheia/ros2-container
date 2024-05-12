#!/usr/bin/env bash

cd "${APP_WORKSPACE_DIR}"
rm -rf src/doosan-robot2 src/ros2_control src/ros2_controllers src/gazebo_ros2_control src/moveit_msgs
git clone https://github.com/doosan-robotics/doosan-robot2.git src/doosan-robot2
git clone https://github.com/ros-controls/ros2_control.git src/ros2_control
git clone https://github.com/ros-controls/ros2_controllers.git src/ros2_controllers
git clone https://github.com/ros-simulation/gazebo_ros2_control.git src/gazebo_ros2_control
git clone -b ros2 --single-branch https://github.com/ros-planning/moveit_msgs src/moveit_msgs
