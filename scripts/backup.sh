#!/bin/bash   
echo "Copying documents .... "
rclone copy /home/mohit/documents drive:documents -v

echo "Copying creds (only gpg) .... "
rclone copy /home/mohit/creds/ drive:creds -v --include="*.gpg"
