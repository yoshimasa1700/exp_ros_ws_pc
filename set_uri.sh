source /opt/ros/melodic/setup.zsh

export ROS_WORKSPACE=~/host_home/workspace/diff_drive_controller_ws
source ${ROS_WORKSPACE}/devel/setup.bash

OWN_IP=`hostname -I| cut -d' ' -f1`

export ROS_MASTER_URI=http://192.168.0.118:11311
export ROS_IP=${OWN_IP}
