FROM nhdezoito/clang:latest

ADD apt_requirements.txt apt_requirements.txt
RUN apt-get install -y $(grep -vE "^\s*#" apt_requirements.txt  | tr "\n" " ") && \
    apt-get autoremove && apt-get autoclean

# RUN git clone https://github.com/TeleMidia/nclcomposer.git

# RUN mkdir -p nclcomposer/build
# RUN ls -lah
# RUN cd nclcomposer/build && \
#     cmake -DWITH_VALIDATOR_EXE=ON  .. && \
#     cmake --build . --target all -- -j 4

# ENTRYPOINT ["/nclcomposer/build/bin/nclvalidator"]
