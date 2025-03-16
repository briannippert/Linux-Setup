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
   git
   vim
   curl
   htop
   nodejs
   npm
   python3
   python3-pip
   build-essential
   dotnet9
   tmux
   default-jdk
   #Required for Jetbrains Toolbox
   libfuse2
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


# Check current Git user.name and user.email
current_username=$(git config --global user.name)
current_email=$(git config --global user.email)

# Display current settings if available
if [ -n "$current_username" ] && [ -n "$current_email" ]; then
    echo "Current Git user.name: $current_username"
    echo "Current Git user.email: $current_email"
    read -p "Do you want to overwrite these values? (y/n): " overwrite

    if [[ "$overwrite" != "y" ]]; then
        echo "Exiting without changes."
        exit 0
    fi
fi

#Setup Git  
read -p "Enter Git user.name: " username
read -p "Enter Git user.email: " email
git config --global user.name "$username"
git config --global user.email "$email"
echo "Git user.name set to: $(git config --global user.name)"
echo "Git user.email set to: $(git config --global user.email)"

# Reload environment variables
source ~/.bashrc
