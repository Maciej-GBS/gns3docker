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

