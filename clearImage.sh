#!/bin/bash

echo $1

#stop inputed first parameter container
docker stop $1

# romove inputed first parameter container
docker rm -f $(docker ps -aq -f name=$1)

# remove inputed first parameter image
docker rmi -f $(docker images -aq $1)

