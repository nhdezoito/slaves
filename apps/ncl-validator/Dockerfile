FROM ubuntu:xenial

LABEL maintainer="Ádrian Lívio Vasconcelos Guedes <nhdezoito@gmail.com>"

ENV IN_DOCKER="nhdezoito/ncl-validator"

RUN apt-get update
ADD apt_requirements.txt apt_requirements.txt
RUN apt-get install -y $(grep -vE "^\s*#" apt_requirements.txt  | tr "\n" " ") && \
    apt-get autoremove && apt-get autoclean

ADD build build
ADD build/bin/* /usr/bin/
ADD build/lib/* /usr/lib/
ADD build/share/* /usr/share/

ENTRYPOINT ["nclvalidator"]
