FROM ubuntu:19.04

WORKDIR /root

# Get required packages
RUN dpkg --add-architecture i386 \
  && apt-get update -y \
  && apt-get upgrade -y \
  && apt-get install -y software-properties-common libssl1.1 libssl1.1:i386 x11vnc
RUN add-apt-repository ppa:gns3/ppa \
  && apt-get update -y \
  && apt-get install -y dynamips gns3 gns3-gui gns3-server gns3-iou \
  && apt-get install -y vim \
  && apt-get clean

# Clean-up
RUN rm -rf /var/lib/apt/lists/* \
  && mkdir -p GNS3/images

# Copy files
COPY start.sh start.sh
COPY images/* GNS3/images/

# VNC ports
EXPOSE 5900 5901 5902

# Start
CMD ["/root/start.sh"]

