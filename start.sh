#!/bin/bash

if [ "$1" = "vnc" ] || [ "$2" = "vnc" ]; then
	Xvfb :1 -screen 0 1600x900x16 &
	x11vnc -display :1.0 -passwd 1234 &

	DISPLAY=:1.0
	export DISPLAY
fi

if [ "$1" = "term" ] || [ "$2" = "term" ]; then
	lxterminal
else
	gns3
fi

