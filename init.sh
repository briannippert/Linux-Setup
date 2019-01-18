#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

sudo apt-get update && apt-get upgrade -y && apt-get autoremove && apt-get autoclean
sudo apt-get install -y vim
sudo apt-get install -y htop
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i -y google-chrome-stable_current_amd64.deb
