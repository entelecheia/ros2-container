#!/bin/bash
# add your custom commands here that should be executed every time the docker container starts
echo "Starting docker container..."
# shellcheck disable=SC1091
source /opt/ros/foxy/setup.zsh

### Set the $PUBLIC_KEY env var to enable SSH access.
# It is useful to have the full SSH server e.g. on Runpod.
# (use SCP to copy files to/from the image, etc)
if [[ -n "$SSH_PUB_KEY" ]] && [[ ! -d "${HOME}/.ssh" ]]; then
    mkdir -p "${HOME}/.ssh"
    echo "${SSH_PUB_KEY}" >"${HOME}/.ssh/authorized_keys"
    chmod -R 700 "${HOME}/.ssh"
fi
sudo service ssh start
