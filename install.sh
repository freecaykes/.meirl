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

if [[$(dpkg -s python | grep Status) != *install ok installed*]];then
    sudo apt-get install python
fi

wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
pip install -r $bin/dev/packages.txt

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

# ipsets

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
