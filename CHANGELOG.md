<!--next-version-placeholder-->

## v0.4.1 (2024-05-12)

### Fix

* Add Docker Compose file for Humble DSR ([`6751e5e`](https://github.com/entelecheia/ros2-container/commit/6751e5e9656d8157a6b7a51618a494c3633659a7))

## v0.4.0 (2024-05-12)

### Feature

* **humble:** Add Dockerfile for ROS Humble with necessary packages ([`e147a33`](https://github.com/entelecheia/ros2-container/commit/e147a330aea75b248309fbc84d5ac8b288b12429))

### Fix

* Update Dockerfile to include additional ROS Humble packages ([`d18e1f8`](https://github.com/entelecheia/ros2-container/commit/d18e1f83d22be8854f850975144ea017da148d99))
* **foxy:** Update Dockerfile to include script for installing CMake version 3.23.2 ([`fdced24`](https://github.com/entelecheia/ros2-container/commit/fdced24dbb5430ba76c7d88a632cabd8138a2736))
* Install dependencies for the Doosan Robot ROS2 package in build-foxy-dsr.sh ([`93d1e1f`](https://github.com/entelecheia/ros2-container/commit/93d1e1f6e07d034aa8b4e95eb2d83480b7702fdb))

## v0.4.0-rc.1 (2024-05-11)

### Feature

* Add Dockerfile for ROS Humble ([`567a210`](https://github.com/entelecheia/ros2-container/commit/567a210f0167011522f1bae03b66f6abca8a5ac1))

## v0.3.1-rc.4 (2024-05-11)



## v0.3.1-rc.3 (2024-05-11)

### Fix

* **foxy:** Update Dockerfile to include script for installing CMake version 3.29.3 ([`156e903`](https://github.com/entelecheia/ros2-container/commit/156e90317a8989add8618d97daae43ec91299bf1))

## v0.3.1-rc.2 (2024-05-11)

### Fix

* Update Dockerfile to use CMake version 3.23.2 and change container username to 'dev' ([`9f0a9e2`](https://github.com/entelecheia/ros2-container/commit/9f0a9e2cacbf038eff78b30e3344f4b6c5b62ec8))
* Update Dockerfile and Docker Compose files to use UID 8001 for the container user ([`ef847ce`](https://github.com/entelecheia/ros2-container/commit/ef847ce0e314da41e89a69d006511777ca75fac4))

## v0.3.1-rc.1 (2024-05-11)

### Fix

* **docker:** Add DISPLAY variable definition ([`4ee21fa`](https://github.com/entelecheia/ros2-container/commit/4ee21fa5095aef61ddf50a7feaeccee48a7a913b))

## v0.3.0 (2024-04-16)

### Feature

* **docker:** Add LATEST_IMAGE_TAG to foxy and foxy-dsr environments ([`b80d7b2`](https://github.com/entelecheia/ros2-container/commit/b80d7b26b02c7a53d32f621a230a98841cba9136))
* **docker:** Add new Copier docker configuration file, `.copier-docker-config.foxy-dsr.yaml` ([`1ed1a43`](https://github.com/entelecheia/ros2-container/commit/1ed1a43ec75ad7741f8e2c6c738c299c0353c3e1))
* **script:** Add docker-run-x11.sh script ([`5620ce0`](https://github.com/entelecheia/ros2-container/commit/5620ce07d121984cdd50a3b46a5797e0357ad692))

### Fix

* **docker-compose:** Add tag command for latest docker image ([`c254ba5`](https://github.com/entelecheia/ros2-container/commit/c254ba559813d2ac752e30a9d18d1709131ba727))
* **docker:** Make user root before adding ROS2 setup ([`27aa329`](https://github.com/entelecheia/ros2-container/commit/27aa3291f067b774c279d8f53e35ae38c76c4474))
* **docker-run-x11:** Fix DISPLAY environment variable assignment ([`4d117f6`](https://github.com/entelecheia/ros2-container/commit/4d117f6bd65cfd1eff008445d19a51f8cf6125ed))

## v0.2.0 (2024-04-06)

### Feature

* **docker:** Added Dockerfile for ROS2 Container user setup and workspace creation ([`da53d31`](https://github.com/entelecheia/ros2-container/commit/da53d316cb1d3f95c19b55642c04641c5ee6d595))
* **docker:** Update docker build configuration to use latest foxy-dsr variant ([`5d61991`](https://github.com/entelecheia/ros2-container/commit/5d619912148d2a2d8ad1dbc293560016cbfd9ca4))

## v0.1.1 (2024-04-05)

### Fix

* **deployment:** Mount X11 socket for GUI applications ([`a00d3da`](https://github.com/entelecheia/ros2-container/commit/a00d3da9bd48e3185254ca1c7e9f086c4a835dc9))
* **docker-compose:** Add DISPLAY environment variable ([`8803e62`](https://github.com/entelecheia/ros2-container/commit/8803e62e0ec4135bae69504f080e45c194519bbd))

## v0.1.0 (2024-04-05)

### Feature

* **docker:** Create non-root user with sudo privileges and update default port numbers ([`3d08aca`](https://github.com/entelecheia/ros2-container/commit/3d08aca681e64cbb73510a11983b6bf534a4ad8b))
* **docker:** Add ROS2 foxy image files ([`1f0650b`](https://github.com/entelecheia/ros2-container/commit/1f0650b234771a54c217faede5ebda512b11690c))
* **docker:** Add custom launch-ros2.sh script for ROS2 support ([`e59d126`](https://github.com/entelecheia/ros2-container/commit/e59d1266ea84cdcf78063672f7ad2000c64bf24a))
* **docker:** Add Dockerfile for ROS2 container deployment ([`39551b4`](https://github.com/entelecheia/ros2-container/commit/39551b423ea0c6c17258708893f8a6c472d0a51a))
* Set the initial version to 0.1.0 ([`679ce5d`](https://github.com/entelecheia/ros2-container/commit/679ce5d69a882813724ec456d49f76386abd11ee))
* **docker:** Add script to build ROS2 workspace ([`bf97481`](https://github.com/entelecheia/ros2-container/commit/bf97481ecf96940ffe117cbd1ed6b89ad87084f9))
* **docker:** Add ROS2 installation and packages for doos-robotics ([`cf2e2de`](https://github.com/entelecheia/ros2-container/commit/cf2e2de27d1b3fdf8e9f2dfb9a86b26847ac08a6))

### Fix

* **docker:** Fix user but changing the home scripts path ([`73993ce`](https://github.com/entelecheia/ros2-container/commit/73993ce287f3802f7f6965a745d12a74c21fdc39))
* **docker:** Update base image to ghcr.io/entelecheia/devcon:latest-ubuntu-20.04 ([`19e7c1b`](https://github.com/entelecheia/ros2-container/commit/19e7c1bd53ff6ff4dd7bf0699757268be58d6db5))
