#!/usr/bin/env bash

DISPLAY=$(ip addr show docker0 | grep -Po 'inet \K[\d.]+'):0

docker run -it --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    ghcr.io/entelecheia/ros2:latest-foxy-dsr \
    bash
