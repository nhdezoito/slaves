#!/bin/bash

TAG=nhdezoito/clang:latest

docker pull ${TAG}
docker build --rm -f clang/Dockerfile -t ${TAG} clang
docker login --username "${DOCKER_USER}" --password "${DOCKER_PASSWD}"
docker push ${TAG}
