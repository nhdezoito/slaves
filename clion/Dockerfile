FROM slaves/cmake:llvm

# Apt packages
ADD apt_requirements.txt apt_requirements.txt
RUN apt-get update
RUN apt-get install -y $(grep -vE "^\s*#" apt_requirements.txt  | tr "\n" " ")

# Install clion
ADD https://download.jetbrains.com/cpp/CLion-2017.1.3.tar.gz .
RUN tar zxvf CLion-2017.1.3.tar.gz
RUN mv clion-2017.1.3 clion

# System settings
RUN echo "fs.inotify.max_user_watches = 524288" >>  /etc/sysctl.conf
RUN sysctl -p --system
