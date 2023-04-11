user="$(whoami)"
backup_directory=/home/$user/bin/backup

echo -n "Backup directory location (default:$backup_dir [ENTER]): "
read -a backup_dir

if [! -z "$backup_directory"]
  then
    backup_directory=$backup_dir
fi

sudo apt-key add ~/Repo.keys
sudo cp -R ~/sources.list* /etc/apt/
sudo dselect update

# update dpkg list
temp_dir=/home/$user/temp_avail
mkdir $temp_dir

apt-cache dumpavail > $temp_dir
sudo dpkg --merge-avail $temp_dir
rm $temp_dir 


sudo dpkg --set-selections < ~/Package.list
sudo apt-get dselect-upgrade -y
