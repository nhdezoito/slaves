#!/bin/sh -e

build_image=nhdezoito/ncl-validator-slave:latest
app_image=nhdezoito/ncl-validator:latest

dir="$(dirname "$(readlink -f "$0")")"
docker pull "${build_image}"

cd "${dir}"

# Build using build image and source from github
mkdir -p ${dir}/build
git clone https://github.com/TeleMidia/nclcomposer.git "${dir}/nclcomposer"|| true

cmd_generate="cd ${dir}/build && pwd && ls -lah ${dir}/nclcomposer && cmake -DWITH_VALIDATOR_EXE=ON ${dir}/nclcomposer"
docker run -i --rm -v ${dir}:${dir} ${build_image} bash -c "${cmd_generate}"
cmd_build="cd ${dir}/build && nproc && cmake --build . --target all -- -j$(nproc)"
docker run -i --rm -v ${dir}:${dir} ${build_image} bash -c "${cmd_build}"

# Create app docker image
docker pull ${app_image}
docker build --rm -f "${dir}/Dockerfile" -t "${app_image}" "${dir}"
docker run -i --rm ${app_image}
docker login --username "${DOCKER_USER}" --password "${DOCKER_PASSWD}"
docker push ${app_image}

cd ${dir}/nclcomposer
latest_commit=$(git describe --always)
latest_tag="nhdezoito/ncl-validator:${latest_commit}"
docker tag ${app_image} ${latest_tag}
docker push ${latest_tag}
