#!/bin/bash

dpkg --get-selections > ~/Package.list
sudo cp -R /etc/apt/sources.list* ~/
sudo apt-key exportall > ~/Repo.keys

user="$(who am i | awk '{print $1}')"
backup_directory=/home/backup

echo -n "Backup directory location (default $backup_directory [ENTER]): "
read -a backup_dir

if [ ! -z "$backup_dir"]
  then
    mkdir $backup_directory
    backup_directory=$backup_dir
fi

echo $backup_directory
rsync -rPz /home/$user "$backup_directory"
