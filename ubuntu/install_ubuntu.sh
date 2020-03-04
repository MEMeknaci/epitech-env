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

echo "Installing docker ..."
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

echo "Starting Docker ..."
systemctl enable docker
systemctl start docker

docker pull epitechcontent/epitest-docker

echo "Creating Aliases ..."
scripts
