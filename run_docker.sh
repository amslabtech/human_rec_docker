#!/bin/bash

echo "=== run_docker ==="

IMAGE_NAME=human_rec_docker
SCRIPT_DIR=$(cd $(dirname $0); pwd)

docker run -it --rm \
  --net='host' \
  --name="human_rec_docker" \
  --volume="$SCRIPT_DIR/:/root/$IMAGE_NAME/" \
  $IMAGE_NAME \
  bash -c "$@"
  # roslaunch /root/$IMAGE_NAME/human_rec.launch
  # bash -c "source /root/catkin_ws/devel/setup.bash;cd catkin_ws && catkin_make;roslaunch /root/catkin_ws/src/human_rec_docker/human_rec.launch"
