#!/bin/bash
# shellcheck disable=SC1091
source "/home/$USERNAME/$APP_DIRNAME/install/setup.bash"
# check /etc/ros/rosdep/sources.list.d/20-default.list and if not present, run sudo rosdep init
if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then
    sudo rosdep init
fi
rosdep update --rosdistro foxy
rosdep install -r --from-paths src --ignore-src --rosdistro foxy -y
# Command to activate the moveit package before colcon build
rm -rf src/doosan-robot2/moveit_config_*/COLCON_IGNORE
colcon build --symlink-install \
    --allow-overriding controller_interface controller_manager hardware_interface \
    --cmake-args '-DCMAKE_BUILD_TYPE=Release' \
    && . install/setup.bash
