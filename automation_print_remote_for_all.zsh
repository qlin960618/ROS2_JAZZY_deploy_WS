#!/usr/bin/zsh

THIS_REPO_PATH=$(dirname $(realpath $0))

print_remote() {
    pushd "$1" || exit
    echo "Remote for dir is in $1"
    git remote get-url origin
    cd $THIS_REPO_PATH
}

#sas_common  sas_conversions  sas_core  sas_datalogger  sas_msgs  sas_robot_driver  sas_robot_kinematics
print_remote src/sas_common
print_remote src/sas_conversions
print_remote src/sas_core
print_remote src/sas_datalogger
print_remote src/sas_msgs
print_remote src/sas_robot_driver
print_remote src/sas_robot_kinematics

# cd to the root of the workspace
cd $THIS_REPO_PATH
