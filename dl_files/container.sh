#!/bin/bash

function scripts()
{
    docker start fedora
    docker exec -it fedora /bin/zsh
    git clone https://github.com/MEMeknaci/epitech-env.git
    mv epitech-env/assets/scripts/start_fedora.sh usr/local/bin
    mv epitech-env/assets/scripts/quit_fedora.sh usr/local/bin
}

function container()
{
    #git clone https://github.com/Epitech/epitest-docker.git
    #mv epitest-docker .epitest-docker
    #cd .epitest-docker
    echo "configuration of docker.."
    ##systemctl enable docker
    sudo systemctl start docker
    ##OPTIONS='--selinux-enabled -G dockerroot'
    ##systemctl restart docker
    sudo groupadd docker
    sudo usermod -aG docker $(whoami)
    sudo service docker start
    sudo chmod 777 /var/run/docker.sock
    echo "starting update and download..."
    #./build.sh --tag latest -n
    docker pull epitechcontent/epitest-docker
    docker run --name fedora -i -d -v ~/.ssh:/root/.ssh -v /home/mmeknaci/delivery:/root/current -w /root epitechcontent/epitest-docker:latest
    echo "moving docker starting scripts.."
    scripts
    sleep 0.5
    echo "Done !"
    echo ""
    echo "Epitech Docker Packages are installed !"
}