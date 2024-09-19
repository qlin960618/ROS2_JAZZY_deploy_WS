#!/bin/bash

THIS_REPO_PATH=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd_and_pull_latest() {
    pushd "$1" || exit
    echo "Pulling latest changes in $1"
    git pull
    cd $THIS_REPO_PATH
}

#sas_common  sas_conversions  sas_core  sas_datalogger  sas_msgs  sas_robot_driver  sas_robot_kinematics
cd_and_pull_latest src/sas_common
cd_and_pull_latest src/sas_conversions
cd_and_pull_latest src/sas_core
cd_and_pull_latest src/sas_datalogger
cd_and_pull_latest src/sas_msgs
cd_and_pull_latest src/sas_robot_driver
cd_and_pull_latest src/sas_robot_kinematics

# cd to the root of the workspace
cd $THIS_REPO_PATH
colcon build --symlink-install