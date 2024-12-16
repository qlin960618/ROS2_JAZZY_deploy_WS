#!/usr/bin/zsh

THIS_REPO_PATH=$(dirname $(realpath $0))

echo "WARNING: This script will update the submodules to the latest commit on the specified branch. some submodule may not up-to-date with compatabe with the current system"

update_remote() {
    pushd "$1" || exit
    echo "Updating remote for submodule $1, to branch $2"
    git fetch
    git checkout $2 || exit
    git pull
    cd $THIS_REPO_PATH
}

#sas_common  sas_conversions  sas_core  sas_datalogger  sas_msgs  sas_robot_driver  sas_robot_kinematics
update_remote src/sas_common ros2
update_remote src/sas_conversions ros2
update_remote src/sas_core jazzy
update_remote src/sas_datalogger ros2
update_remote src/sas_msgs ros2
update_remote src/sas_robot_driver f0edae7
update_remote src/sas_robot_kinematics ros2

# cd to the root of the workspace
cd $THIS_REPO_PATH
