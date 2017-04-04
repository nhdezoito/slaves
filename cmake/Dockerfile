FROM ubuntu:xenial

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=$PATH:/bin/:/usr/bin/

ADD apt_requirements.txt apt_requirements.txt
RUN apt-get update && \
    apt-get install -y $(grep -vE "^\s*#" apt_requirements.txt  | tr "\n" " ")

RUN wget https://cmake.org/files/v3.7/cmake-3.7.2-Linux-x86_64.sh && \
    chmod +x ./cmake-3.7.2-Linux-x86_64.sh &&\
    ./cmake-3.7.2-Linux-x86_64.sh --skip-license

RUN cmake --version
RUN make --version
RUN ls -lah /usr/bin | grep 5
RUN gcc-5 --version
RUN g++-5 --version
