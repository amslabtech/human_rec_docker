#!/bin/bash

echo "=== run_docker ==="

IMAGE_NAME=human_rec_docker
SCRIPT_DIR=$(cd $(dirname $0); pwd)

./update_repositories.py

docker run -it --rm \
  --net='host' \
  --name="human_rec_docker" \
  --volume="$SCRIPT_DIR/:/root/catkin_ws/src/$IMAGE_NAME/" \
  $IMAGE_NAME \
  bash -c "cd catkin_ws && catkin_make && cd .. && bash"
