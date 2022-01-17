#!/bin/bash

source dl_files/display_ft.sh
source dl_files/installation.sh

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root (type sudo ./install.sh)"
    exit 1
fi

CHECK="True"

echo -e "\e[31mInstalling docker ...\e[37m"
dnf install docker -y

if [ $CHECK == "True" ]; then
    #read -p "Are you sure to download this container [Y/N] " -r choice
    #if [[ $choice =~ ^[Yy]$ ]]; then
    installation
    #elif [[ $choice =~ ^[nN]$ ]]; then
        #echo "cancelling program.. exit"
    #else
        #echo "wrong answer.. exit"
    #fi
fi
