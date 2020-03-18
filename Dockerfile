FROM ubuntu:19.04

WORKDIR /root

# Get required packages
RUN apt-get update -y \
  && apt-get upgrade -y \
  && apt-get install -y software-properties-common
RUN add-apt-repository ppa:gns3/ppa \
  && apt-get update -y \
  && apt-get install -y dynamips gns3 gns3-gui gns3-server gns3-iou \
  && apt-get install -y vim \
  && apt-get clean
libssl1.1 libssl1.0.0
x11vnc

# Clean-up
RUN rm -rf /var/lib/apt/lists/*

# Copy files
COPY start.sh start.sh

# VNC ports
EXPOSE 5900 5901 5902

# Start
CMD ["/root/start.sh"]

