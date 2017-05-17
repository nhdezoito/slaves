FROM  ubuntu:xenial

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=$PATH:/bin/:/usr/bin/

# install requirements
ADD apt_requirements.txt apt_requirements.txt
RUN apt-get update && \
    apt-get install -y $(grep -vE "^\s*#" apt_requirements.txt  | tr "\n" " ")
