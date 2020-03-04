#!/bin/bash

# START AND QUIT CONTAINER SCRIPTS #
function scripts()
{
    sudo cp assets/scripts/start_fedora.sh /usr/local/bin
    sudo cp assets/scripts/quit_fedora.sh /usr/local/bin
}

# CONTAINER CONFIG AND INSTALLATION #
function container()
{
    echo -e "\e[31mconfiguration of docker..\e[37m"
    sudo systemctl start docker
    sudo groupadd docker
    sudo usermod -aG docker $(whoami)
    sudo service docker start
    sudo chmod 777 /var/run/docker.sock
    echo -e "\e[31mstarting update and download...\e[37m"
    docker pull epitechcontent/epitest-docker
    echo -e "\e[31mmoving docker starting scripts..\e[37m"
    scripts
    sleep 0.5
    echo -e "\e[31mcontainer initialization..\e[37m"
    ./assets/init_fedora.sh
    echo ""
    echo -e "\e[31mEpitech Docker Packages are installed !\e[37m"
}
