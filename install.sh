#!/bin/bash

source dl_files/display_ft.sh
source dl_files/installation.sh

CHECK="False"
echo ""
echo "ping test..."
ping -w0.3 -c1 google.com &>/dev/null && ping -c 4 8.8.8.8 && CHECK="True" || CHECK="False"
echo "-------------------------------"
sleep 1
if [ $CHECK == "True" ]; then
    display_ft
    sleep 5
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
