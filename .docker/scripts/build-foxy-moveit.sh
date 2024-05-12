#!/bin/bash
# Install dependencies for the MoveIt2 package.
# sudo apt-get install -y \
#     ros-foxy-chomp-motion-planner \
#     ros-foxy-stomp
    # ros-foxy-moveit-planners-chomp \
    # ros-foxy-moveit-chomp-optimizer-adapter \
    # ros-foxy-moveit-servo \
    # ros-foxy-moveit-runtime \
    # ros-foxy-moveit-ros-planning \
    # ros-foxy-moveit-common \
    # ros-foxy-warehouse-ros-mongo
# shellcheck disable=SC1091
source "${APP_WORKSPACE_DIR}/install/setup.bash"
cd "${APP_WORKSPACE_DIR}"
# check /etc/ros/rosdep/sources.list.d/20-default.list and if not present, run sudo rosdep init
if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then
    sudo rosdep init
fi
rosdep update --rosdistro foxy
rosdep install -r --from-paths src --ignore-src --rosdistro foxy -y
# build fcl library
# cmake -S src/fcl -B build/fcl
# export fcl_DIR="${APP_WORKSPACE_DIR}/build/fcl"
# Command to activate the moveit package before colcon build
rm -rf src/doosan-robot2/moveit_config_*/COLCON_IGNORE
colcon build --symlink-install \
    --cmake-args '-DCMAKE_BUILD_TYPE=Release' &&
    . install/setup.bash

    # --allow-overriding controller_interface controller_manager hardware_interface warehouse_ros \

# python3-argcomplete python-lxml \
# libpoco-dev libomp-dev libmongoclient-dev mongodb \
# ros-foxy-desktop ros-foxy-ros-base \
# ros-dev-tools ros-foxy-realtime-tools \
# ros-foxy-xacro \
# ros-foxy-object-recognition-msgs \
# ros-foxy-control-msgs
# ros-foxy-octomap \
# ros-foxy-gazebo-ros ros-foxy-gazebo-ros-pkgs \
# ros-foxy-eigen-stl-containers \
# ros-foxy-random-numbers \
# ros-foxy-moveit-resources-panda-description \
# ros-foxy-moveit-resources-panda-moveit-config \
# ros-foxy-moveit-resources-fanuc-description \
# ros-foxy-moveit-resources-fanuc-moveit-config \
# ros-foxy-moveit-resources-pr2-description \
# ros-foxy-ros-testing \
# ros-foxy-pybind11-vendor \
# ros-foxy-ompl ros-foxy-urdfdom-py \
# ros-foxy-gripper-controllers \
# ros-foxy-joint-state-publisher-gui \
# ros-foxy-joint-state-broadcaster \

# ros-dev-tools libpoco-dev ros-foxy-control-msgs ros-foxy-realtime-tools \
# ros-foxy-xacro ros-foxy-joint-state-publisher-gui ros-foxy-object-recognition-msgs \
# ros-foxy-octomap-msgs ros-foxy-gazebo-ros ros-foxy-gazebo-ros-pkgs ros-foxy-control-toolbox \
