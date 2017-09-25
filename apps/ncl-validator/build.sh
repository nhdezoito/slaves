#!/bin/sh -e

build_image=nhdezoito/ncl-validator-slave:latest
app_image=nhdezoito/ncl-validator:latest

dir="$(dirname "$(readlink -f "$0")")"
docker pull "${build_image}"

# Build using build image and source from github
git clone --depth=1 https://github.com/TeleMidia/nclcomposer.git || true
mkdir -p ${dir}/build
cmd_generate="cd ${dir}/build && cmake -DWITH_VALIDATOR_EXE=ON ../nclcomposer"
docker run -i --rm -v ${dir}:${dir} ${build_image} bash -c "${cmd_generate}"
cmd_build="cd ${dir}/build && nproc && cmake --build . --target all -- -j$(nproc)"
docker run -i --rm -v ${dir}:${dir} ${build_image} bash -c "${cmd_build}"
cmd_build="${dir}/build/bin/nclvalidator"
docker run -i --rm -v ${dir}:${dir} ${build_image} bash -c "${cmd_build}"

# Create app docker image
docker build --rm -f "${dir}/Dockerfile" -t "${app_image}" "${dir}"
docker run -i --rm ${app_image} nclvalidator
docker login --username "${DOCKER_USER}" --password "${DOCKER_PASSWD}"
docker push ${app_image}
