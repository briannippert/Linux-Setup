#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

sudo add-apt-repository universe
sudo add-apt-repository multiverse

sudo apt-get update && apt-get upgrade -y && apt-get autoremove -y && apt-get autoclean -y
sudo apt-get install -y vim
sudo apt-get install -y htop
sudo apt-get install -y nodejs
sudo apt-get install -y npm
sudo apt-get install -y python3
sudo apt-get install -y python3-pip
sudo apt-get install -y apache2
sudo apt-get install -y openssh-server
sudo apt-get install -y build-essential

