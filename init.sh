#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo -n "Would you like to install GUI Apps? (Y/n): "
read installGUIApps
mkdir setup
cd setup
{
############General Updates###############
sudo apt-get update && apt-get upgrade -y && apt-get autoremove -y && apt-get autoclean -y
############Development Packages###############

dev_packages=(
   vim
   curl
   htop
   nodejs
   npm
   python3
   net-tools
   python3-pip
   build-essential
   dotnet6
   default-jdk

)

gui_packages={
   psensor
   notepadqq
}


sudo apt-get install -y "${dev_packages[@]}"


if [[ "$installGUIApps" != "n" ]]; then
   sudo apt-get install -y "${gui_packages[@]}"
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
fi
#Cleanup
cd ..
rm -rf setup


#############Reload Env Variables#########
source ~/.bashrc

}||{
  rm -rf setup 
}
