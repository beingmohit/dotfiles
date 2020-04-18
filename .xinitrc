#! /bin/bash
picom &
devilspie -a &
exec i3 --shmlog-size=26214400
xmodmap ~/.Xmodmap

