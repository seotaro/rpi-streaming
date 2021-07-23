LATEST := 2021.3
#ARM_VER := armv7 # PI2, PI3, PI4 
ARM_VER := armv6 # ZERO

install:
	sudo apt-get update
	sudo apt-get upgrade
	sudo apt-get install libnspr4 libnss3 libxtst6
	sudo modprobe bcm2835-v4l2 max_video_width=2592 max_video_height=1944

	wget https://github.com/shiguredo/momo/releases/download/${LATEST}/momo-${LATEST}_raspberry-pi-os_${ARM_VER}.tar.gz
	tar zxf momo-${LATEST}_raspberry-pi-os_${ARM_VER}.tar.gz
	mv momo-${LATEST}_raspberry-pi-os_${ARM_VER} momo
	cp test.html momo/html

start:
	cd momo && ./momo --resolution=HD --force-i420 --hw-mjpeg-decoder=true --no-audio-device test

start-service:
	sudo cp momo.service /etc/systemd/system
	sudo systemctl enable momo.service
	sudo systemctl start momo.service

stop-service:
	sudo systemctl stop momo.service
	sudo systemctl disable momo.service
	sudo rm /etc/systemd/system/momo.service




