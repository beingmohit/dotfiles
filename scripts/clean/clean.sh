#!/bin/bash
set -e

docker rm -v $(docker ps -a -q -f status=exited) || true
docker rmi $(docker images -f "dangling=true" -q) || true
docker volume prune || true

#blacklist
#pacnew 
#pythone packages /usr/lib/py*
#.cache files
#~/home whitelist
#unsed users and groups
#/root
#broken symlinks
#npm bin in /usr/bin

#orphans
sudo pacman -Rns $(pacman -Qtdq) || true 

#pacman -S $(pacman -Qq | grep python-) 

#reqired by pythone: pacman -Qi python

# list packages pacman -Qe
