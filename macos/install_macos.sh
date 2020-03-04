#!/bin/bash

function scripts()
{
     sudo cp assets/scripts/start_fedora.sh /usr/local/bin
     sudo cp assets/scripts/quit_fedora.sh /usr/local/bin
     sudo cp assets/scripts/create_fedora.sh /usr/local/bin
}

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root (type sudo ./install_fedora.sh)"
   exit 1
fi

docker pull epitechcontent/epitest-docker

echo "Creating Aliases ..."
scripts
