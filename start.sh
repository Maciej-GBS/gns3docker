#!/bin/bash

Xvfb :1 -screen 0 1600x900x16 &
x11vnc -display :1.0 -passwd 1234 &

DISPLAY=:1.0
export DISPLAY
gns3

