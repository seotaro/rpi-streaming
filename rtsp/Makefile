#ARM_VER := arm32v7 # PI2, PI3, PI4 
ARM_VER := arm32v6 # ZERO

start:
	sudo docker pull mpromonet/v4l2rtspserver:latest-${ARM_VER}
	sudo docker run --restart=always --device=/dev/video0 -p 5050:5050 -it mpromonet/v4l2rtspserver:latest-${ARM_VER} -F30 -W1920 -H1080 -P5050 
