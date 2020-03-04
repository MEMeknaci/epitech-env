#!/bin/bash

source dl_files/display_ft.sh
source dl_files/installation.sh

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root (type sudo ./install.sh)"
    exit 1
fi

CHECK="False"

echo -e "\nping test..."
ping -w0.3 -c1 google.com &>/dev/null && ping -c 3 8.8.8.8 && CHECK="True" || CHECK="False"
echo "-------------------------------"
sleep 1

echo -e "\e[31mInstalling docker ...\e[37m"
dnf install docker -y
echo -e "\e[31mInstalling expect scripts ...\e[37m"
dnf install expect -y

if [ $CHECK == "True" ]; then
    read -p "Are you sure to download this container [Y/N] " -r choice
    if [[ $choice =~ ^[Yy]$ ]]; then
        installation
    elif [[ $choice =~ ^[nN]$ ]]; then
        echo "cancelling program.. exit"
    else
        echo "wrong answer.. exit"
    fi
else
    echo "Retry when you have connection.."
fi
