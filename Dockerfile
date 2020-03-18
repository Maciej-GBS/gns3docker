FROM ubuntu:19.04

WORKDIR /root

ENV DEBIAN_FRONTEND noninteractive

# Get required packages
RUN apt-get update -y \
  && apt-get upgrade -y \
  && apt-get install -y software-properties-common libssl1.1 x11vnc \
  && apt-get install -y lxterminal telnet vim
RUN add-apt-repository ppa:gns3/ppa \
  && apt-get update -y \
  && apt-get install -y dynamips ubridge qemu
RUN dpkg --add-architecture i386 \
  && apt-get update -y \
  && apt-get install -y libssl1.1:i386 \
  && apt-get install -y gns3 gns3-gui gns3-server gns3-iou \
  && apt-get clean

# Clean-up
RUN rm -rf /var/lib/apt/lists/* \
  && mkdir -p GNS3/images/IOS

# Copy files
COPY start.sh start.sh
COPY images/* GNS3/images/IOS/

ENV DEBIAN_FRONTEND=

# VNC ports
EXPOSE 5900 5901 5902

# Start
CMD ["/root/start.sh"]

