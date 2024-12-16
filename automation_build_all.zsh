#!/usr/bin/zsh

THIS_REPO_PATH=$(dirname $(realpath $0))

# cd to the root of the workspace
cd $THIS_REPO_PATH
# need to build sas_core and sas_msgs first for dependencies, (maybe there is a better way to do this)
colcon build --symlink-install --packages-select sas_core
colcon build --symlink-install --packages-select sas_msgs
# build the rest of the packages
colcon build --symlink-install
