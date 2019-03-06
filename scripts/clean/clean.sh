#!/bin/bash
set -e

docker rm -v $(docker ps -a -q -f status=exited) || true
docker rmi $(docker images -f "dangling=true" -q) || true
docker volume prune || true



