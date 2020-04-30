#! /bin/bash

#picom &
#devilspie -a &
#glava --desktop &

xmodmap ~/.Xmodmap

exec i3 --shmlog-size=26214400
