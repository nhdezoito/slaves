FROM nhdezoito/clang:latest

ADD apt_requirements.txt apt_requirements.txt
RUN apt-get install -y $(grep -vE "^\s*#" apt_requirements.txt  | tr "\n" " ") && \
    apt-get autoremove && apt-get autoclean
