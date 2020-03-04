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
    echo "configuration of docker.."
    sudo systemctl start docker
    sudo groupadd docker
    sudo usermod -aG docker $(whoami)
    sudo service docker start
    sudo chmod 777 /var/run/docker.sock
    echo "starting update and download..."
    docker pull epitechcontent/epitest-docker
    echo "moving docker starting scripts.."
    scripts
    sleep 0.5
    echo "Done !"
    docker run --name fedora -i -d -v ~/.ssh:/root/.ssh -v $HOME:/root/current -w /root epitechcontent/epitest-docker:latest
    echo ""
    echo "Epitech Docker Packages are installed !"
}
