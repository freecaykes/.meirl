#!/bin/bash

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
user=(whoami)
bin=/home/$user/bin/

mkdir $bin

# BASH
cp $SCRIPT_DIR/bash/* $bin

source /home/$user/.bashrc

# DEV
cp $SCRIPT_DIR/dev $bin

if [[$(dpkg -s python | grep Status) != *install ok installed* ]]; then
    sudo apt-get install python
fi

wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
pip install -r $bin/dev/packages.txt --no-index

rm get-pip.py

# i3
TMP="/home/$user/.config_tmp"
if [ -d TMP ]; then
   mkdir $TMP
fi

cd $TMP
git clone git://github.com/vivien/i3blocks
# more repo when udpdated ...

for plugin in "$TMP"/*
do
  cd $plugin
  make clean all &&
  make install
  cd $TMP
done

# vimrc
cp $SCRIPT_DIR/vim/.vimrc /home/$user/
# Vundle cause I'm a pleb
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c PluginInstall ~/.vimrc&
vim_pid=$!

kill -9 $vim_pid

# ipsets
if [[$(dpkg -s ippset | grep Status) != *install ok installed* ]]; then
  sudo apt-get install ipset
fi

sudo bash $SCRIPT_DIR/ipsets/ipset_dshield.sh
sudo bash $SCRIPT_DIR/ipsets/ipset_em.sh

cp $SCRIPT_DIR/ipsets $bin

# network
cp $SCRIPT_DIR/network $bin

# sound
cp $SCRIPT_DIR/sound $bin

# system
cp $SCRIPT_DIR/system $bin

# clean self
rm -rf $TMP
cd $SCRIPT_DIR/..
rm -rf $SCRIPT_DIR
