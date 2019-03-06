#!/bin/bash
set -e

LOSTFILES=$(lostfiles)

echo $LOSTFILES | while read line ; do
   echo === $line ===
done