user="$(whoami)"
backup_directory=/home/$user/bin/backup

echo -n "Backup directory location (default:$backup_dir [ENTER]): "
read -a backup_dir

if [! -z "$backup_directory"]
  then
    backup_directory=$backup_dir
fi

rsync -rPz "$backup_directory" /home/$user

sudo apt-key add ~/Repo.keys
sudo cp -R ~/sources.list* /etc/apt/
sudo apt-get update
sudo apt-get install dselect
sudo dpkg --set-selections < ~/Package.list
sudo dselect
