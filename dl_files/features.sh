#!/bin/bash

function features()
{
    echo ""
    echo "Installation of ohmyzsh.."
    start_fedora
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo ""
    echo "Installation of ohmyzsh.."
}