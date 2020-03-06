#!/bin/bash

# START AND QUIT CONTAINER SCRIPTS #
function scripts()
{
    sudo cp assets/scripts/start_epienv /usr/local/bin
    sudo cp assets/scripts/quit_epienv /usr/local/bin
}

# CONTAINER CONFIG AND INSTALLATION #
function container()
{
    echo -e "\e[31mconfiguration of docker ...\e[37m"
    sudo systemctl enable docker
    sudo groupadd docker
    sudo usermod -aG docker $(whoami)
    sudo service docker start
 
    echo -e "\e[31mstarting update and download ...\e[37m"
    docker pull epitechcontent/epitest-docker

    echo -e "\e[31mmoving docker starting scripts ...\e[37m"
    scripts
    sleep 0.5

    echo -e "\n\e[32mEpitech Docker Packages are installed !\e[37m"
}
