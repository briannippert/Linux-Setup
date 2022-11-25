#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi


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
sudo apt-get install -y build-essential
sudo apt-get install -y dotnet6

#############Reload Env Variables#########
source ~/.bashrc

