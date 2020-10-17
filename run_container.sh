#!/bin/sh
script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

HOME_TO_CURRENT=`realpath --relative-to=$HOME $PWD`

xhost +local:root
           # docker run \
docker run -it \
      --env="DISPLAY" \
      --env="QT_X11_NO_MITSHM=1" \
      --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
      --volume="/$HOME:/root/host_home:rw" \
      --volume="/media:/media:rw" \
      --volume="/ext:/ext:rw" \
      --net host \
      --privileged \
      --device /dev/bus/usb/:/dev/bus/usb/ \
      --device /dev/input/:/dev/input/ \
      --tty \
      -w "/root/host_home/$HOME_TO_CURRENT" \
      test_env:20200922 \
      /bin/bash
export containerId=$(docker ps -l -q)
xhost -local:rootls
