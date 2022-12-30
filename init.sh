#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi
mkdir setup
cd setup
{
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
#Install Vs Code#
wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
cp "download?build=stable&os=linux-deb-x64" "vsCode.deb"
chmod 777 "vsCode.deb"
sudo apt-get install "./vsCode.deb"

#install Discord
wget "https://discord.com/api/download?platform=linux&format=deb"
cp "download?platform=linux&format=deb" "discord.deb"
chmod 777 "discord.deb"
sudo apt-get install "./discord.deb"

#Cleanup
cd ..
rm -rf setup


#############Reload Env Variables#########
source ~/.bashrc

}||{
  rm -rf setup 
}