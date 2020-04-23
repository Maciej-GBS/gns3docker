FROM ubuntu:19.10

WORKDIR /root

ENV DEBIAN_FRONTEND noninteractive

# Get required packages
RUN apt-get update -y \
  && apt-get upgrade -y
RUN echo "wireshark-common wireshark-common/install-setuid boolean true" | debconf-set-selections
RUN apt-get install -y software-properties-common libssl1.1 x11vnc \
  && apt-get install -y lxterminal telnet vim
RUN add-apt-repository ppa:gns3/ppa \
  && apt-get update -y \
  && apt-get install -y dynamips=0.2.21-1~disco1 ubridge=0.9.16-1~disco1 qemu=1:3.1+dfsg-2ubuntu3.7
RUN dpkg --add-architecture i386 \
  && apt-get update -y \
  && apt-get install -y libssl1.1:i386=1.1.1b-1ubuntu2.4 \
  && apt-get install -y gns3-gui=2.2.5~disco1 gns3-server=2.2.5~disco1 gns3-iou=0.0.2~disco8 \
  && apt-get install -y wireshark \
  && apt-get clean
# gns3=0.8.7-2

# Clean-up
RUN rm -rf /var/lib/apt/lists/* 

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

