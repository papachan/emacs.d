#!/bin/bash

which emacs || { echo "Install First Emacs"; exit 1; }

# Full path of script
if [ "$(uname)" == "Darwin" ]; then
	SCRIPT_PATH=`pwd`
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    SCRIPT_PATH=$(readlink -f "$(dirname "$0")")
fi

# Install packages and update submodules
cd $SCRIPT_PATH
cask

git submodule init
git submodule update --init --recursive
git clone --recursive   git@github.com:emacsmirror/python-mode.git  vendor/python-mode.el

# Backup existing .emacs.d
if [ -e "$HOME/.emacs.d" ]; then
    echo "Moving existing ~/.emacs.d to ~/.emacs.d-$(date +%s).old"
    mv $HOME/.emacs.d{,-$(date +%s).old}
fi

cd $SCRIPT_PATH

# Create soft link
ln -sv $SCRIPT_PATH ~/.emacs.d
