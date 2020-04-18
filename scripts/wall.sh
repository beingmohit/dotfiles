#/bin/bash

UNSPLASH_URL="https://source.unsplash.com/random/1920x1080/?wallpapers"

mkdir -p ~/.unsplash

echo "fetching file"
wget $UNSPLASH_URL -4 -O /tmp/unsplash.jpg && mv /tmp/unsplash.jpg ~/.unsplash/photo.jpg

if [ -f ~/.unsplash/photo.jpg ]; then
  echo "setting backgroud"
  feh --bg-fill ~/.unsplash/photo.jpg

  echo "setting lock"
  ~/scripts/lock.sh -u ~/.unsplash/photo.jpg
fi