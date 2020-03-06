#!/bin/bash

function scripts()
{
     sudo cp assets/scripts/start_epienv /usr/local/bin
     sudo cp assets/scripts/quit_epienv /usr/local/bin
}

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root (type sudo ./install_fedora.sh)"
   exit 1
fi

echo -e "\e[31mstarting update and download...\e[37m"
docker pull epitechcontent/epitest-docker

echo -e "\e[31mmoving docker starting scripts..\e[37m"
scripts
sleep 0.5

echo -e "\n\e[32mEpitech Docker Packages are installed !\e[37m"
