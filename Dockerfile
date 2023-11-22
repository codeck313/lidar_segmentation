FROM ros:noetic
ENV DEBIAN_FRONTEND=noninteractive
#FROM osrf/ros:noetic-desktop-full
SHELL ["/bin/bash", "-c"]

# ros desktop full for GUIs
# p2os to understand robot messages
RUN apt-get update && apt-get install -y \
        ros-noetic-desktop-full \
        ros-noetic-p2os-msgs \
        git \
        software-properties-common\
        ros-noetic-robot-localization
        
        
RUN apt-get install -y ros-noetic-joy ros-noetic-teleop-twist-joy \
  ros-noetic-teleop-twist-keyboard ros-noetic-laser-proc ros-noetic-twist-mux \
  ros-noetic-rgbd-launch ros-noetic-rosserial-arduino \
  ros-noetic-rosserial-python ros-noetic-rosserial-client \
  ros-noetic-rosserial-msgs ros-noetic-amcl ros-noetic-map-server \
  ros-noetic-move-base ros-noetic-urdf ros-noetic-xacro \
  ros-noetic-compressed-image-transport ros-noetic-rqt* ros-noetic-rviz \
  ros-noetic-gmapping ros-noetic-navigation ros-noetic-interactive-markers \
  ros-noetic-dynamixel-sdk ros-noetic-turtlebot3-msgs ros-noetic-turtlebot3\
  ros-noetic-twist-mux ros-noetic-pointcloud-to-laserscan ros-noetic-ddynamic-reconfigure\
  ros-noetic-realsense2-camera python3-pip
  
  
# install custom ROS packages (to understand its messages)
RUN mkdir -p /catkin_ws/src
WORKDIR /catkin_ws/src
ADD https://api.github.com/repos/tuw-cpsg/general-ros-modules/compare/master...HEAD /dev/null
RUN git clone https://github.com/tuw-cpsg/general-ros-modules.git
RUN sudo add-apt-repository ppa:borglab/gtsam-release-4.0 -y
RUN sudo apt install libgtsam-dev libgtsam-unstable-dev -y
RUN sudo apt-get install libfftw3-dev python3-catkin-tools  -y
RUN sudo apt-get install tmux -y

# build custom ROS packages
WORKDIR /catkin_ws
RUN source /opt/ros/noetic/setup.bash && catkin_make

# initialize ROS (master uri, environments, etc.)
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

# default command
CMD ["bash"]
