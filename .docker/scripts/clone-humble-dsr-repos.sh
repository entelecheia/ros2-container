#!/usr/bin/env bash

cd "${APP_WORKSPACE_DIR}"
rm -rf src/doosan-robot2
git clone -b humble-devel --single-branch https://github.com/doosan-robotics/doosan-robot2.git src/doosan-robot2
