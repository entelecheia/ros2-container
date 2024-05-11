#!/usr/bin/env bash

git clone https://github.com/ros-planning/moveit2 src/moveit2
git clone -b ros2 --single-branch https://github.com/ros-planning/warehouse_ros src/warehouse_ros
git clone -b ros2 --single-branch  https://github.com/ros-planning/warehouse_ros_mongo src/warehouse_ros_mongo
git clone -b ros2 --single-branch https://github.com/ros-planning/srdfdom src/srdfdom
git clone -b ros2 --single-branch https://github.com/ros-planning/geometric_shapes src/geometric_shapes
git clone -b use_new_joint_handle https://github.com/ShotaAk/fake_joint src/fake_joint
# To build a fake_joint package that is compatible with our ROS2 package.
cp src/doosan-robot2/common2/resource/fake_joint_driver_node.cpp fsrc/ake_joint/fake_joint_driver/src/fake_joint_driver_node.cpp
