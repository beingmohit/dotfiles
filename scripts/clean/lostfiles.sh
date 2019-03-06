#!/bin/bash
set -e

# LOSTFILES=$(lostfiles)

# echo $LOSTFILES | while read line ; do
#    echo
#    echo === $line ===
#    echo
# done

LOSTFILES=()
WHITELIST=()
BLACKLIST=()

while read -r line; do
   LOSTFILES+=($line)
done < <(lostfiles)

while read -r line; do
   WHITELIST+=($line)
done < <(cat lists/whitelist)

while read -r line; do
   BLACKLIST+=($line)
done < <(cat lists/blacklist)

for i in "${LOSTFILES[@]}"; do
   for j in "${WHITELIST[@]}"; do
      if [ $i == $j ]; then
         continue 2
      fi

      if [[ $i =~ $j ]]; then
         continue 2
      fi
   done

   for k in "${BLACKLIST[@]}"; do
      if [ $i == $k ]; then
         continue 2
      fi

      if [[ $i =~ $k ]]; then
         continue 2
      fi
   done

   echo $i
done
