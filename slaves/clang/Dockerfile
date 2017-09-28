FROM ubuntu:xenial

# System Enviroment
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=$PATH:/bin/:/usr/bin/:/usr/sbin/

# Locale Enviroment
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Clang Enviroment
ENV LLVM_VERSION=4.0
ENV CC=clang
ENV CXX=clang++

# Apt packages
RUN echo 'deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-4.0 main' >> /etc/apt/sources.list
ADD llvm-snapshot.gpg.key llvm-snapshot.gpg.key
RUN apt-key add ./llvm-snapshot.gpg.key
RUN apt-get update
ADD apt_requirements.txt apt_requirements.txt
RUN apt-get install -y $(grep -vE "^\s*#" apt_requirements.txt  | tr "\n" " ") && \
    apt-get autoremove && apt-get autoclean
# Update Locale
RUN locale-gen en_US.UTF-8 

# Install CMake
RUN wget https://cmake.org/files/v3.9/cmake-3.9.3-Linux-x86_64.sh -O cmake.sh && \
    chmod +x ./cmake.sh && \
    ./cmake.sh --skip-license && \
    rm -fv ./cmake.sh

# Configure Clang
RUN update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-$LLVM_VERSION 100
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-$LLVM_VERSION 100
RUN update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-$LLVM_VERSION 100
RUN update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-$LLVM_VERSION 100
RUN update-alternatives --install /usr/bin/lldb lldb /usr/bin/lldb-$LLVM_VERSION 100
RUN update-alternatives --install /usr/bin/lld lld /usr/bin/lld-$LLVM_VERSION 100
RUN update-alternatives --install /usr/bin/llvm-profdata llvm-profdata /usr/bin/llvm-profdata-$LLVM_VERSION 100
RUN update-alternatives --install /usr/bin/llvm-cov llvm-cov /usr/bin/llvm-cov-$LLVM_VERSION 100
RUN update-alternatives --install /usr/bin/llvm-symbolizer llvm-symbolizer /usr/bin/llvm-symbolizer-$LLVM_VERSION 100
