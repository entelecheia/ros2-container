#!/bin/bash
# shellcheck disable=SC1091
rosdep install -r --from-paths src --ignore-src --rosdistro foxy -y
# Command to activate the moveit package before colcon build
rm -rf src/doosan-robot2/moveit_config_*/COLCON_IGNORE    
colcon build  --symlink-install &&
    . install/setup.bash
