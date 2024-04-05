# Sets the base image for subsequent instructions
ARG ARG_BUILD_FROM="library/ubuntu:20.04"
FROM $ARG_BUILD_FROM AS builder

# Sets labels for the image
LABEL org.opencontainers.image.source="https://github.com/entelecheia/ros2-container"
LABEL org.opencontainers.image.description="ROS2 Container for development and deployment"
LABEL org.opencontainers.image.licenses="MIT"

# Setting this argument prevents interactive prompts during the build process
ARG DEBIAN_FRONTEND=noninteractive
# Updates the image and installs necessary packages
RUN apt-get update --fix-missing \
    && apt-get install -y curl wget jq sudo gosu git build-essential \
    software-properties-common locales locales-all fontconfig fonts-nanum \
    tzdata openssh-server
# Install ROS2
RUN add-apt-repository universe
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
RUN apt update
RUN apt-get install -y ros-foxy-desktop python3-argcomplete ros-foxy-ros-base python3-argcomplete \
        ros-dev-tools libpoco-dev ros-foxy-control-msgs ros-foxy-realtime-tools \
        ros-foxy-xacro ros-foxy-joint-state-publisher-gui ros-foxy-object-recognition-msgs \
        ros-foxy-octomap-msgs ros-foxy-gazebo-ros ros-foxy-gazebo-ros-pkgs ros-foxy-control-toolbox \
    # Cleans up unnecessary packages to reduce image size
    && apt-get autoremove -y \
    && apt-get clean -y

# Sets Python environment variables
ENV PIP_DEFAULT_TIMEOUT 100
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Setting ARGs and ENVs for the app
ARG ARG_APP_INSTALL_ROOT="/opt"
ARG ARG_APP_DIRNAME="entelecheia"
ENV APP_INSTALL_ROOT $ARG_APP_INSTALL_ROOT
ENV APP_DIRNAME $ARG_APP_DIRNAME
ENV APP_SRC_DIR=${APP_INSTALL_ROOT}/${APP_DIRNAME}
ENV APP_VIRTUAL_ENV=${APP_INSTALL_ROOT}/.venvs/${APP_DIRNAME}
ENV PATH="$APP_VIRTUAL_ENV/bin:$PATH"
ENV APP_WORKSPACE_ROOT=${APP_INSTALL_ROOT}/workspace
ARG ARG_WORKSPACE_ROOT="/workspace"
ENV WORKSPACE_ROOT $ARG_WORKSPACE_ROOT
# Sets up the workspace for the user
RUN mkdir -p $WORKSPACE_ROOT/projects

# Sets the working directory to workspace root
WORKDIR $WORKSPACE_ROOT

# Sets the time zone within the container
ENV TZ="Asia/Seoul"
# Sets up the locale to en_US.UTF-8
RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 || true

# Setting ARGs and ENVs for user creation and workspace setup
ARG ARG_USERNAME="app"
ARG ARG_USER_UID=9001
ARG ARG_USER_GID=$ARG_USER_UID
ENV USERNAME $ARG_USERNAME
ENV USER_UID $ARG_USER_UID
ENV USER_GID $ARG_USER_GID

# Creates a non-root user with sudo privileges
RUN groupadd --gid $USER_GID $USERNAME \
    && adduser --uid $USER_UID --gid $USER_GID --force-badname --disabled-password --gecos "" $USERNAME  \
    && echo "$USERNAME:$USERNAME" | chpasswd \
    && adduser $USERNAME sudo \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Fixes sudo error related to core dumps
RUN echo "Set disable_coredump false" > /etc/sudo.conf

# Switches to the newly created user
USER $USERNAME

# install dotfiles
ARG ARG_USER_FULLNAME="Dev User"
ARG ARG_USER_EMAIL="dev@domain.com"
ARG ARG_GITHUB_USERNAME=""
ARG ARG_SYSTEM_HOSTNAME="dev-container"
ARG ARG_WORKSPACE_LOCATION="/"
ENV USER_FULLNAME $ARG_USER_FULLNAME
ENV USER_EMAIL $ARG_USER_EMAIL
ENV GITHUB_USERNAME $ARG_GITHUB_USERNAME
ENV SYSTEM_HOSTNAME $ARG_SYSTEM_HOSTNAME
ENV WORKSPACE_LOCATION $ARG_WORKSPACE_LOCATION

ENV DOTFILES_APPLY_ROOTMOI=0
ENV DOTFILES_USE_CODE=1
ENV DOTFILES_USE_PYTHON_TOOLS=1
ENV REMOTE_CONTAINERS=1
# ENV DOTFILES_DEBUG=1

RUN sh -c "$(wget -qO- https://dotfiles.entelecheia.ai/install)"

USER root
RUN chown --recursive "${USER_UID}:${USER_GID}" "${WORKSPACE_ROOT}"
RUN chown --recursive "${USER_UID}:${USER_GID}" "${APP_INSTALL_ROOT}"

# Install doosan-robotics packages for ROS2
# ### We assume that you have installed the ros-foxy-desktop package using the apt-get command.
# ### We recommand the /home/<user_home>/ros2_ws/src
USER $USERNAME

RUN mkdir -p ~/ros2_ws/src
RUN cd ~/ros2_ws/src \
    && git clone https://github.com/doosan-robotics/doosan-robot2.git \
    && git clone https://github.com/ros-controls/ros2_control.git \
    && git clone https://github.com/ros-controls/ros2_controllers.git \
    && git clone https://github.com/ros-simulation/gazebo_ros2_control.git \
    && cd ros2_control && git reset --hard 3dc62e28e3bc8cf636275825526c11d13b554bb6 && cd .. \
    && cd ros2_controllers && git reset --hard 83c494f460f1c8675f4fdd6fb8707b87e81cb197 && cd .. \
    && cd gazebo_ros2_control && git reset --hard 3dfe04d412d5be4540752e9c1165ccf25d7c51fb && cd .. \
    && git clone -b ros2 --single-branch https://github.com/ros-planning/moveit_msgs

    # Copies scripts from host into the image
COPY ./.docker/scripts/ ./scripts/
# RUN pip install -r ./scripts/requirements-base.txt
RUN bash ${WORKSPACE_ROOT}/scripts/ros2_ws_build.sh
RUN echo "source ~/ros2_ws/install/setup.bash" >> ~/.bashrc

# Specifies the command that will be executed when the container is run
CMD ["bash"]
