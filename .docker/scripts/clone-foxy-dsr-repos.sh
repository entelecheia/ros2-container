#!/usr/bin/env bash

cd "${APP_WORKSPACE_DIR}"
rm -rf src/doosan-robot2 src/ros2_control src/ros2_controllers src/gazebo_ros2_control src/moveit_msgs
git clone https://github.com/doosan-robotics/doosan-robot2.git src/doosan-robot2
git clone https://github.com/ros-controls/ros2_control.git src/ros2_control
git clone https://github.com/ros-controls/ros2_controllers.git src/ros2_controllers
git clone https://github.com/ros-simulation/gazebo_ros2_control.git src/gazebo_ros2_control
git clone -b ros2 --single-branch https://github.com/ros-planning/moveit_msgs src/moveit_msgs
# This script is used to reset the submodules in the repo to specific commits.
cd src/ros2_control && git reset --hard 3dc62e28e3bc8cf636275825526c11d13b554bb6 && cd ../..
cd src/ros2_controllers && git reset --hard 83c494f460f1c8675f4fdd6fb8707b87e81cb197 && cd ../..
cd src/gazebo_ros2_control && git reset --hard 3dfe04d412d5be4540752e9c1165ccf25d7c51fb && cd ../..
