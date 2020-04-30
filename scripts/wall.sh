#/bin/bash

UNSPLASH_URL="https://source.unsplash.com/random/1920x1080/?wallpapers,night"

WALLPAPER_PATH=~/.unsplash/photo.jpg

if [ -n "$1" ]; then
  echo "creating directory"
  mkdir -p ~/.unsplash

  echo "fetching file"
  wget $UNSPLASH_URL -4 -O /tmp/unsplash.jpg && mv /tmp/unsplash.jpg ~/.unsplash/photo.jpg

  WALLPAPER_PATH=~/.unsplash/photo.jpg
fi 

if [ -f $WALLPAPER_PATH ]; then
  echo "setting chrome backgroud"
  cp $WALLPAPER_PATH .config/chromium/Default/background.jpg 

  echo "setting i3 backgroud"
  feh --bg-fill $WALLPAPER_PATH

  echo "setting lock"
  ~/scripts/lock.sh -u $WALLPAPER_PATH
fi
