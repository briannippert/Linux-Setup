#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

##########System/Repository Stuff#########
sudo add-apt-repository universe
sudo add-apt-repository multiverse

############General Updates###############
sudo apt-get update && apt-get upgrade -y && apt-get autoremove -y && apt-get autoclean -y

############Development Packages###############
sudo apt-get install -y vim
sudo apt-get install -y curl
sudo apt-get install -y htop
sudo apt-get install -y nodejs
sudo apt-get install -y npm
sudo apt-get install -y python3
sudo apt-get install -y net-tools
sudo apt-get install -y python3-pip
sudo apt-get install -y openssh-server
sudo apt-get install -y build-essential

############GUI Tools###############
sudo apt-get install -y arc-theme
sudo apt install -y gnome-tweak-tool
sudo apt install -y indicator-multiload

#############Snap Packages################
sudo snap install code --classic
sudo snap install slack --classic

#############Mongo#########
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org

#############Reload Env Variables#########
source ~/.bashrc

