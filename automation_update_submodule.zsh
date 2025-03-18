!/usr/bin/zsh

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
update_remote src/sas_common jazzy
update_remote src/sas_conversions jazzy
update_remote src/sas_core jazzy
update_remote src/sas_datalogger jazzy
update_remote src/sas_msgs jazzy
update_remote src/sas_robot_driver panda_jazzy_stable
update_remote src/sas_robot_kinematics jazzy

# cd to the root of the workspace
cd $THIS_REPO_PATH
