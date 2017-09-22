#!/bin/bash

docker pull nhdezoito/clang:latest
docker build --rm -f clang/Dockerfile -t nhdezoito/clang:latest clang
docker login --username $DOCKER_USER --password $DOCKER_PASSWD
docker push nhdezoito/clang:latest
