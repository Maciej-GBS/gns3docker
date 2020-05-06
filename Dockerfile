FROM ubuntu:19.10

WORKDIR /root

ENV DEBIAN_FRONTEND noninteractive

# Get required packages x64 only
RUN apt-get update -y \
  && apt-get upgrade -y
RUN echo "wireshark-common wireshark-common/install-setuid boolean true" | debconf-set-selections
RUN apt-get install -y software-properties-common libssl1.1 x11vnc \
  && apt-get install -y lxterminal telnet vim
RUN add-apt-repository ppa:gns3/ppa \
  && apt-get update -y \
  && apt-get install -y dynamips ubridge qemu \
  && apt-get install -y wireshark gns3-gui

# Clean-up
RUN apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Make dirs
RUN mkdir -p GNS3/images/IOS \
  && mkdir -p GNS3/projects

# Copy files
COPY entry.sh entry.sh
COPY images/* GNS3/images/IOS/

# Set privileges
RUN chmod -R 0777 .

# Set projects as volume
VOLUME ["/root/GNS3/projects"]

ENV DEBIAN_FRONTEND=

# VNC ports
EXPOSE 5900 5901 5902

# Start
ENTRYPOINT ["/root/entry.sh"]

