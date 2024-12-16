#!/usr/bin/zsh

THIS_REPO_PATH=$(dirname $(realpath $0))

zsh ./automation_update_submodule.zsh

cd $THIS_REPO_PATH
zsh ./automation_build_all.zsh