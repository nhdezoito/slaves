FROM ubuntu:xenial

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=$PATH:/bin/:/usr/bin/

# Apt packages
RUN echo 'deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main' >> /etc/apt/sources.list
ADD llvm-snapshot.gpg.key llvm-snapshot.gpg.key
RUN apt-key add ./llvm-snapshot.gpg.key
RUN apt-get update
ADD apt_requirements.txt apt_requirements.txt
RUN apt-get install -y $(grep -vE "^\s*#" apt_requirements.txt  | tr "\n" " ")

# CMake
ADD https://cmake.org/files/v3.7/cmake-3.7.2-Linux-x86_64.sh cmake-3.7.2-Linux-x86_64.sh
RUN chmod +x ./cmake-3.7.2-Linux-x86_64.sh
RUN ./cmake-3.7.2-Linux-x86_64.sh --skip-license

# Clang
ENV LLVM_VERSION=3.8

RUN update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-$LLVM_VERSION 100
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-$LLVM_VERSION 100
RUN update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-$LLVM_VERSION 100
RUN update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-$LLVM_VERSION 100
RUN update-alternatives --install /usr/bin/lldb lldb /usr/bin/lldb-$LLVM_VERSION 100
RUN update-alternatives --install /usr/bin/lld lld /usr/bin/lld-$LLVM_VERSION 100
RUN update-alternatives --install /usr/bin/llvm-profdata llvm-profdata /usr/bin/llvm-profdata-$LLVM_VERSION 100
RUN update-alternatives --install /usr/bin/llvm-cov llvm-cov /usr/bin/llvm-cov-$LLVM_VERSION 100

ENV CC=clang
ENV CXX=clang++

# Cleanup
RUN rm ./cmake-3.7.2-Linux-x86_64.sh && \
    apt-get -y autoremove && apt-get -y autoclean
