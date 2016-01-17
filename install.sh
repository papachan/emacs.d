#! /usr/bin/env bash

# Full path of script
SCRIPT_PATH=`pwd`

# Install packages and update submodules
cd $SCRIPT_PATH
cask

git submodule init
git submodule update --init --recursive
git clone --recursive   git@github.com:emacsmirror/python-mode.git  vendor/python-mode.el

cd lib
echo "download iflipb.el"
curl -J -O https://raw.githubusercontent.com/jrosdahl/iflipb/master/iflipb.el
echo "download directory-files-recursive.el"
curl -J -O https://gist.githubusercontent.com/dmgerman/5675462/raw/1af30f73c7d1f246dd69efe3cbfc327f160fca1a/directory-files-recursive.el
echo "download twittering-mode.el"
curl -J -O https://raw.githubusercontent.com/hayamiz/twittering-mode/master/twittering-mode.el
echo "download helm-aws.el"
curl -J -O https://raw.githubusercontent.com/istib/helm-aws/master/helm-aws.el

# Backup existing .emacs.d
if [ -e "$HOME/.emacs.d" ]; then
    echo "Moving existing ~/.emacs.d to ~/.emacs.d-$(date +%s).old"
    mv $HOME/.emacs.d{,-$(date +%s).old}
fi

cd $SCRIPT_PATH

# Create soft link
ln -sv $SCRIPT_PATH ~/.emacs.d
