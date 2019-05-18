#!/bin/bash
set -e

confirm() {
    echo 
    read -p "$1 Are you sure? (y/n) : " -n 1 -r
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "\n Exiting.."
        exit 1 
    fi
    echo
}

if [[ $(docker ps -a -q -f status=exited) ]]; then
    confirm "Removing exited docker containers."
    docker rm -v $(docker ps -a -q -f status=exited) || true
fi 

if [[ $(docker images -f "dangling=true" -q) ]]; then
    confirm "Removing dangling docker images."
    docker rmi $(docker images -f "dangling=true" -q) || true
fi 

confirm "Removing unused docker volumes."
docker volume prune 

while read -r line; do
    if test -f "$line"; then
        echo "Deleting $line"
    fi
done < <(cat lists/blacklist)

confirm "These files will be deleted."

while read -r line; do
    if test -f "$line"; then
        rm -rf $line
    fi
done < <(cat lists/blacklist)

if [[ $(sudo pacman -Qtdq) ]]; then
    confirm "Removing orphans packages"
    sudo pacman -Rns $(sudo pacman -Qtdq)
fi

# pythone packages
# broken symlinks
# logs
# orphans
#sudo pacman -Rns $(pacman -Qtdq) || true 
#pacman -S $(pacman -Qq | grep python-) 
#reqired by pythone: pacman -Qi python
# list packages pacman -Qe
