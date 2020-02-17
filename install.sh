#!/bin/bash

function env_install()
{
    echo "salut"
    git clone https://github.com/Epitech/epitest-docker.git
    cd epitest-docker
    echo "starting update and download..."
    ./build.sh --tag latest -n
}

CHECK="False"
echo ""
echo "ping test ..."
ping -w1 -c1 google.com &>/dev/null && ping -c 3 8.8.8.8 && CHECK="True" || CHECK="False"
if [ $CHECK == "True" ]; then
    echo "-------------------------------

///     FEATURES THAT YOU ARE GOING TO INSTALL     ///

##  COMPLETE SYSTEM UPDATE BEFORE STARTING ##

DOWNLOAD EPITECH ENVIRONMENT UNDER FEDORA WITH
##  GIT
##  BLIH
##  VALGRIND
##  GCC
##  CUNIT
##  NETCAT
##  CMAKE
##  TCSH
##  CURL
##  NODEJS
##  PYTHON3
##  RUBY
##  NORMEZ
##  NCURSES LIB
##  SFML, SDL AND CSFML LIB
##  BOOST
##  GHC
##  ZSH
##  OH MY ZSH (custom)
##  EMACS (Epitech plugins)
##  ZIP / UNZIP
##  ADD USEFUL SCRIPTS (more on MEMeknaci github)
##  ADD SOME ALLIAS
##  ..."
    read -p "Are you sure to download those features [Y/N] " -r choice
    if [[ $choice =~ ^[Yy]$ ]]; then
        env_install
    elif [[ $choice =~ ^[nN]$ ]]; then
        echo "no"
    else
        echo "wrong answer.. exit"
    fi
else
    echo "Retry when you have connection.."
fi