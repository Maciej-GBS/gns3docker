if [ "$1" = "vnc" ]; then
	docker run -d --rm gns3:latest vnc
else
	docker run -d --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --user="$(id --user):$(id --group)" gns3:latest
fi

