FROM ros:melodic-ros-base

SHELL ["/bin/bash", "-c"]

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

RUN apt-key adv --keyserver 'hkp://ha.pool.sks-keyservers.net:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN apt update

RUN apt install -y --no-install-recommends ros-melodic-pcl-ros \
                                           ros-melodic-tf* \
                                           ros-melodic-angles \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root

RUN mkdir -p catkin_ws/src

RUN cd catkin_ws/src && source /opt/ros/melodic/setup.bash; catkin_init_workspace

RUN cd catkin_ws && source /opt/ros/melodic/setup.bash; catkin_make

RUN cd /root && echo source /root/catkin_ws/devel/setup.bash >> .bashrc

ENV ROS_PACKAGE_PATH=/root/catkin_ws:$ROS_PACKAGE_PATH

ENV ROS_WORKSPACE=/root/catkin_ws

WORKDIR /root/catkin_ws

RUN source /opt/ros/melodic/setup.bash && catkin_make

ENV ROS_PACKAGE_PATH=/root/catkin_ws:/opt/ros/melodic/share:$ROS_PACKAGE_PATH

WORKDIR /root

COPY ./ros_entrypoint.sh /

CMD ["/ros_entrypoint.sh"]
