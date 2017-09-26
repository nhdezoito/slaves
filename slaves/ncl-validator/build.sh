#!/bin/sh -e

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
TAG=nhdezoito/ncl-validator-slave:latest

docker pull "${TAG}"
docker build --rm -f "${SCRIPT_DIR}/Dockerfile" -t "${TAG}" "${SCRIPT_DIR}"
docker login --username "${DOCKER_USER}" --password "${DOCKER_PASSWD}"
docker push ${TAG}
