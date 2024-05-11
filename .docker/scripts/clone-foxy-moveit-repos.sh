#!/usr/bin/env bash

rm -rf src/moveit2 src/warehouse_ros src/warehouse_ros_mongo src/srdfdom src/geometric_shapes src/fake_joint
git clone -b main --single-branch https://github.com/moveit/moveit2 src/moveit2
git clone -b ros2 --single-branch https://github.com/moveit/warehouse_ros src/warehouse_ros
git clone -b ros2 --single-branch https://github.com/moveit/warehouse_ros_mongo src/warehouse_ros_mongo
git clone -b foxy --single-branch https://github.com/moveit/srdfdom src/srdfdom
git clone -b foxy --single-branch https://github.com/moveit/geometric_shapes src/geometric_shapes
git clone -b use_new_joint_handle --single-branch https://github.com/ShotaAk/fake_joint src/fake_joint
# To build a fake_joint package that is compatible with our ROS2 package.
cp src/doosan-robot2/common2/resource/fake_joint_driver_node.cpp src/fake_joint/fake_joint_driver/src/fake_joint_driver_node.cpp
