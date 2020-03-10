#!/bin/bash

docker unpause fedora &>/dev/null
if [ ${?} = '0' ]; then
    docker exec -it fedora /bin/zsh
    wait
    docker pause fedora
else
    docker start fedora
    docker exec -it fedora /bin/zsh
    wait
    docker pause fedora
fi