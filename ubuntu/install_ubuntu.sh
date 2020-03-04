#!/bin/bash

function scripts()
{
    sudo cp assets/scripts/start_fedora.sh /usr/local/bin
    sudo cp assets/scripts/quit_fedora.sh /usr/local/bin
}

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root (type sudo ./install_fedora.sh)"
   exit 1
fi

echo -e "\e[31mInstalling docker ...\e[37m"
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
echo -e "\e[31mInstalling expect scripts ...\e[37m"
dnf install expect -y

echo -e "\e[31mconfiguration of docker ...\e[37m"
systemctl enable docker
systemctl start docker

echo -e "\e[31mstarting update and download...\e[37m"
docker pull epitechcontent/epitest-docker

echo -e "\e[31mmoving docker starting scripts..\e[37m"
scripts
sleep 0.5

echo -e "\e[31mcontainer initialization..\e[37m"
./assets/init_fedora.exp

echo -e "\n\e[31mEpitech Docker Packages are installed !\e[37m"
