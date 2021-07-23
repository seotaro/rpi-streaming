start-service:
	sudo cp youtube.service /etc/systemd/system
	sudo systemctl enable youtube.service
	sudo systemctl start youtube.service

stop-service:
	sudo systemctl stop youtube.service
	sudo systemctl disable youtube.service
	sudo rm /etc/systemd/system/youtube.service
