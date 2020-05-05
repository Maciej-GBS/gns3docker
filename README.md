# GNS3
GNS3 docker image on ubuntu. Allows to start a VNC server with GNS3 inside or opens a window in your session.

Default folder for all files is `/root`. If you want to have your preferences saved (by default gns3 always starts fresh) mount this path.

> VOLUMES: /root/GNS3/projects

## Requirements
- docker
- X11 session (or VNC)
- TightVNC / TigerVNC / Remmina / RealVNC / Any other VNC client (optional)

## How To Run
`$ docker run --rm gns-vnc`

`$ vncviewer 172.17.0.2:5900` with default password `1234`

172.17.0.2 is the IP address of docker container, which may vary.
To check your container IP use this command:

`ip address show docker0` to see interface configuration.

`docker inspect <container id>` to see exact container IP.

A nice run script which sets up all the necessary parameters:
```
#!/bin/bash

if [ "$1" = "vnc" ]; then
	docker run \
		--rm \
		-v gjn:/root/GNS3/projects \
		gns3:19.04 vnc $2
else
	docker run \
		--rm \
		-v gjn:/root/GNS3/projects \
		-it -e DISPLAY=$DISPLAY \
		-e user=$(id --user) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		gns3:19.04 $1
fi
```

> USAGE: `./script.sh [vnc] [term]`

## First Steps
Preferences > Server > Host: 127.0.0.1 | 172.17.0.2

This will fix the connection error which pop ups at startup.

> NOTE: The same can be done through the welcome window, it is usually obstructed by error notifications. Close the error dialogs and follow the setup with 127.0.0.1 instead of localhost server target.

> **ISSUE**: It may be impossible to switch to telnet terminal in the vnc window. Workaround: remove an item or close a dialog in the GNS3 program, then hovering a mouse will switch the cursor to desired terminal.

Another thing you need to do is to setup a terminal that will be used:

Preferences > General > Console application > Edit button > change `gnome-terminal` to `lxterminal`

## Save & Load
Save and load docker image to file.

`$ docker save gns-vnc > /tmp/gns-vnc.tar`

`$ docker load < /tmp/gns-vnc.tar`

