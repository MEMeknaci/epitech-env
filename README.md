# epitech-env
This is a docker epitech container with more features under Fedora.
It will download and configure Docker in a way that will let you have a container running the same way as the "Moulinette" does.

## How to install it ?
1. If you are using Fedora, go to fedora folder :
```
$ sudo .install.sh
```

2. If you are using Ubuntu, go to ubuntu folder :
```
$ sudo ./install_ubuntu.sh
```

3. If you are using MacOS, go to macos folder :

Please Download the official Docker Desktop app : <a href="https://download.docker.com/mac/stable/Docker.dmg">Docker </a>

```
$ sudo ./install_macos.sh
```

## How to run the container ?

* Launch this only once to create the container
```
$ init_fedora
```
* Launch this command every time you want to launch the container
```
$ start_fedora
```
* If you want to stop the program for the day or more, launch this command
```
$ quit_fedora
```
