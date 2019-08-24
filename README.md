# human_rec_docker

[![Build Status](https://travis-ci.org/amslabtech/human_rec_docker.svg?branch=master)](https://travis-ci.org/amslabtech/human_rec_docker)

ROS package for publishing obstacle position and pointcloud

# Install and build
```
git clone https://github.com/amslabtech/human_rec_docker.git
cd human_rec_docker
./build.sh
```

# How to use
```
for getting human position
./run_docker.sh
(in docker container)
roslaunch human_detection human_pos_publisher.launch
```
