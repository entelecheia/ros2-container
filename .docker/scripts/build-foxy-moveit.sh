#!/bin/bash

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
    --allow-overriding controller_interface controller_manager hardware_interface \
    --cmake-args '-DCMAKE_BUILD_TYPE=Release' &&
    . install/setup.bash

    # --allow-overriding controller_interface controller_manager hardware_interface warehouse_ros \
