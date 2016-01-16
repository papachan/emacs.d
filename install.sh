#! /usr/bin/env bash

# Full path of script
SCRIPT_PATH=$(readlink -f "$(dirname "$0")")

# Init and update submodules
cd $SCRIPT_PATH
git submodule init
git submodule update --init --recursive
git clone --recursive   git@github.com:emacsmirror/python-mode.git  vendor/python-mode.el

# Backup existing .emacs.d
if [ -e "$HOME/.emacs.d" ]; then
    echo "Moving existing ~/.emacs.d to ~/.emacs.d-$(date +%s).old"
    mv $HOME/.emacs.d{,-$(date +%s).old}
fi

# Create soft link
ln -sv $SCRIPT_PATH ~/.emacs.d
