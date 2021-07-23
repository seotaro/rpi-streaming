install:
	sudo apt install nginx libnginx-mod-rtmp
	sudo cp rtmp-live.conf /etc/nginx/modules-available
	cd /etc/nginx/modules-enabled && sudo ln -s ../modules-available/rtmp-live.conf ./99-rtmp-live.conf
	
	# 配信ファイルを RAM ディスクに出力する。
	echo "tmpfs    /tmp    tmpfs   defaults,noatime,mode=1777    0    0" | sudo tee -a /etc/fstab

	cd /var/www/html && sudo ln -s /tmp/live live
	sudo cp index.html /var/www/html

	sudo systemctl restart nginx.service

	chmod +x start-hls-streaming.sh

start:
	ffmpeg \
		-f v4l2 -thread_queue_size 8192 -input_format yuyv422 \
		-video_size 1280x720 -framerate 30 \
		-i /dev/video0 \
		-c:v h264_omx -b:v 3000k \
		-bufsize 3000k -vsync 1 -g 10 \
		-f flv rtmp://localhost/live/stream

start-service:
	sudo cp hls-streaming.service /etc/systemd/system
	sudo systemctl enable hls-streaming.service
	sudo systemctl start hls-streaming.service

stop-service:
	sudo systemctl stop hls-streaming.service
	sudo systemctl disable hls-streaming.service
	sudo rm /etc/systemd/system/hls-streaming.service
