#!/bin/bash

user="$(whoami | awk '{print $1}')"
backup_directory=/home/$user/backup

read -p "Backup directory location (default $backup_directory [ENTER]):" $backup_dir

if [ ! -z "$backup_dir"]; then
    backup_directory=$backup_dir
fi

if [ ! -d "$DIRECTORY" ]; then
    mkdir $backup_directory
fi

dpkg --get-selections > $backup_directory/Package.list
sudo cp -R /etc/apt/sources.list* $backup_directory/
sudo apt-key exportall > $backup_directory/Repo.keys

echo $backup_directory
