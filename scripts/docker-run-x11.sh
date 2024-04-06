#!/usr/bin/env bash

docker run -it --rm \
    -e DISPLAY=host.docker.internal:0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    ghcr.io/entelecheia/ros2:latest-foxy-dsr \
    bash
