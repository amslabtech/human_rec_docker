FROM kazukitakahashi/ros_kinetic_pcl1.8

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

RUN apt-key adv --keyserver 'hkp://ha.pool.sks-keyservers.net:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN apt-get update

RUN apt-get install -y ros-kinetic-pcl-ros

RUN apt-get install -y ros-kinetic-camera-info-manager \
                       ros-kinetic-image-geometry

WORKDIR /root/catkin_ws/src

RUN git clone https://github.com/matchey/visualization_tools
RUN git clone https://github.com/matchey/mmath
RUN git clone https://github.com/matchey/kf_tracking
RUN git clone https://github.com/matchey/human_detection
RUN git clone -b test https://github.com/taka-kazu/euclidean_cluster

WORKDIR /root/catkin_ws

RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash; catkin_make -j24"

ENV ROS_PACKAGE_PATH=/root/catkin_ws:/root/AMSL_ros_pkg:/opt/ros/kinetic/share:$ROS_PACKAGE_PATH
RUN echo export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/root/AMSL_ros_pkg >> /root/.bashrc

WORKDIR /root
