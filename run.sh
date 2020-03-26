if [ "$1" = "vnc" ]; then
	docker run -d --rm -v gjn:/root/GNS3/projects gns3:latest vnc
else
	docker run -d --rm -v gjn:/root/GNS3/projects -it -e DISPLAY --user="$(id --user):$(id --group)" -v /tmp/.X11-unix:/tmp/.X11-unix gns3:latest
fi

