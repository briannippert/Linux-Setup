#!/bin/bash

# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# Prompt the user to decide whether to install GUI applications
echo -n "Would you like to install GUI Apps? (Y/n): "
read installGUIApps

# Update the system, upgrade packages, remove unnecessary packages, and clean up
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y && sudo apt-get autoclean -y

# List of development packages to be installed
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
   dotnet8
   default-jdk
)

# Install the development packages
sudo apt-get install -y "${dev_packages[@]}"

# Install the GUI packages if the user chose to do so
if [[ "$installGUIApps" != "n" ]]; then
   gui_packages=(
      psensor
      notepadqq
      gnome-tweaks
   )
   
   sudo apt-get install -y "${gui_packages[@]}"

   # Download and install Visual Studio Code
   wget -qO vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
   sudo dpkg -i vscode.deb
   sudo apt-get install -f -y # Fix dependencies

   # Download and install Discord
   wget -qO discord.deb "https://discord.com/api/download?platform=linux&format=deb"
   sudo dpkg -i discord.deb
   sudo apt-get install -f -y # Fix dependencies

   # Clean up downloaded .deb files
   rm vscode.deb discord.deb
fi

# Reload environment variables
source ~/.bashrc
