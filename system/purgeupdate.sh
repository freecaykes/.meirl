# !/bin/bash

# freecaykes
apt autoremove  #  clean up

uname_r=$(uname -r)
version_regex='[0-9]\{1,\}.[0-9]\{1,\}.[0-9]\{1,\}-[0-9]\{1,\}'
base_ver=$(echo "$uname_r" | grep -o $version_regex)

dpkg -l | grep linux-image | while read -r line ; do
  version=$( echo "$line" | grep -o $version_regex | head -1 ) 
  if ! [[ $version == *$base_ver* ]]; then
    echo | sudo apt purge linux-image-"$version"
  fi
done


apt-get update
apt -f install
apt-get dist-upgrade
apt-get upgrade

uname -r
