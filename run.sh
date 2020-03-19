if [ "$1" = "vnc" ]; then
	docker run -d --rm gns3:latest vnc
else
	docker run -it --rm -d -e DISPLAY --user="$(id --user):$(id --group)" -v /tmp/.X11-unix:/tmp/.X11-unix gns3:latest
fi

