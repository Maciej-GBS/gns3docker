# GNS-VNC
GNS3 docker image + some images

## Requirements
- docker
- TightVNC / TigerVNC / Remmina / RealVNC / Any other VNC client

## How To Run
`$ docker run --rm gns-vnc`

`$ vncviewer 172.17.0.2:5900` with default password `1234`

172.17.0.2 is the IP address of docker container, which may vary.
To check your container IP use this command:

`ip address show docker0` to see interface configuration.

`docker inspect <container id>` to see exact container IP.

## First Steps
Preferences > Server > Host: 127.0.0.1 | 172.17.0.2

This will fix the connection error which pop ups at startup.

> NOTE: The same can be done through the welcome window, it is usually obstructed by error notifications.

> **ISSUE**: It may be impossible to switch to telnet terminal in the vnc window. Workaround: remove an item or close a dialog in the GNS3 program, then hovering a mouse will switch the cursor to desired terminal.

## Save & Load
Save and load docker image to file. Allows to share image with others without publishing.

`$ docker save gns-vnc > /tmp/gns-vnc.tar`

`$ docker load < /tmp/gns-vnc.tar`

# Legal Notice
Because I have not checked the legal implications in distributing Cisco binaries **PLEASE DO NOT SHARE THIS THROUGH PUBLIC CHANNELS**

