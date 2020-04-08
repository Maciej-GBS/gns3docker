if [ "$1" = "vnc" ]; then
	docker run \
		-d --rm \
		--add-host localhost:127.0.0.1 \
		-v gjn:/root/GNS3/projects \
		gns3:latest vnc $2
else
	docker run \
		--rm \
		--add-host localhost:127.0.0.1 \
		-v gjn:/root/GNS3/projects \
		-it -e DISPLAY=$DISPLAY \
		-e user=$(id --user) \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		gns3:latest $1
fi

