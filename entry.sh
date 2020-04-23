#!/bin/bash

if [ "$1" = "vnc" ] || [ "$2" = "vnc" ]; then
	echo "Setting up vnc server..."

	Xvfb :1 -screen 0 1600x900x16 &
	x11vnc -display :1.0 -passwd 1234 &

	DISPLAY=:1.0
	export DISPLAY
fi

if [ "$user" != "" ]; then
	echo "Creating gienio..."
	useradd --create-home --user-group --uid $user gienio
	usermod -aG ubridge gienio
	usermod -aG libvirt gienio
	usermod -aG kvm gienio
	usermod -aG wireshark gienio
	ln -s /root/GNS3 /home/gienio/GNS3
fi

if [ "$1" = "term" ] || [ "$2" = "term" ]; then
	if [ "$user" != "" ]; then
		echo "Running as gienio..."
		su gienio -c "lxterminal"
	else
		lxterminal
	fi
else
	if [ "$user" != "" ]; then
		echo "Running as gienio..."
		su gienio -c "gns3"
	else
		gns3
	fi
fi

