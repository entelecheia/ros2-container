#!/bin/bash
# add your custom commands here that should be executed every time the docker container starts
rm -rf "${APP_WORKSPACE_DIR}"
. "${SCRIPTS_DIR}/clone-foxy-dsr-repos.sh"
. "${SCRIPTS_DIR}/reset-foxy-dsr-submodule.sh"
. "${SCRIPTS_DIR}/build-foxy-dsr.sh"
. "${SCRIPTS_DIR}/clone-foxy-moveit-repos.sh"
. "${SCRIPTS_DIR}/build-foxy-moveit.sh"
echo "Starting docker container..."
