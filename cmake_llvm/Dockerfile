FROM ubuntu:xenial

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=$PATH:/bin/:/usr/bin/

# Apt packages
ADD apt_requirements.txt apt_requirements.txt
RUN apt-get update
RUN apt-get install -y $(grep -vE "^\s*#" apt_requirements.txt  | tr "\n" " ")

# CMake
ADD https://cmake.org/files/v3.7/cmake-3.7.2-Linux-x86_64.sh cmake-3.7.2-Linux-x86_64.sh
RUN chmod +x ./cmake-3.7.2-Linux-x86_64.sh
RUN ./cmake-3.7.2-Linux-x86_64.sh --skip-license

ENV CC=clang-3.8
ENV CXX=clang++-3.8

# Cleanup
RUN rm ./cmake-3.7.2-Linux-x86_64.sh && \
    apt-get -y autoremove && apt-get -y autoclean
