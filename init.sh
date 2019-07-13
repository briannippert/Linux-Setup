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
sudo apt-get install -y vim
sudo apt-get install -y htop
sudo apt install gnome-tweak-tool
sudo apt-get install -y nodejs
sudo apt-get install -y npm
sudo apt-get install -y python3
sudo apt-get install -y python3-pip
sudo apt-get install -y openssh-server
sudo apt-get install -y build-essential

#########Docker###########################
sudo apt-get install docker.io

#############Snap Packages################
sudo snap install github-desktop --edge
sudo snap install code --classic
sudo snap install slack --classic

#############Reload Env Variables#########
source ~/.bashrc

#############VS Code Extensions###########
code --install-extension Angular.ng-template
code --install-extension bierner.color-info
code --install-extension christian-kohler.npm-intellisense
code --install-extension Compulim.vscode-clock
code --install-extension cyrilletuzi.angular-schematics
code --install-extension Dart-Code.dart-code
code --install-extension Dart-Code.flutter
code --install-extension eamodio.gitlens
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.code-runner
code --install-extension HookyQR.beautify
code --install-extension johnpapa.Angular2
code --install-extension karigari.chat
code --install-extension leizongmin.node-module-intellisense
code --install-extension mohsen1.prettify-json
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension ms-vsliveshare.vsliveshare-audio
code --install-extension ms-vsliveshare.vsliveshare-pack
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension PKief.material-icon-theme
code --install-extension redhat.vscode-yaml
code --install-extension rogalmic.bash-debug
code --install-extension shakram02.bash-beautify
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension Zignd.html-css-class-completion


