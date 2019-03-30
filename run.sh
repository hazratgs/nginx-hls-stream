#!/bin/bash
# GNU bash, version 4.3.46

apt-get update
sudo apt-get install build-essential libpcre3 libpcre3-dev libssl-dev -y
apt install zlib1g-dev -y
apt install zlib1g -y
mkdir ~/working
cd ~/working
wget http://nginx.org/download/nginx-1.13.8.tar.gz
wget https://github.com/arut/nginx-rtmp-module/archive/master.zip
sudo apt-get install unzip -y
tar -zxvf nginx-1.13.8.tar.gz
unzip master.zip
cd nginx-1.13.8
./configure --with-http_ssl_module --with-http_stub_status_module --add-module=../nginx-rtmp-module-master
make
sudo make install
sudo wget https://raw.github.com/JasonGiedymin/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx
sudo chmod +x /etc/init.d/nginx
sudo update-rc.d nginx defaults
sudo mkdir /HLS
sudo mkdir /HLS/live
sudo mkdir /HLS/mobile
sudo mkdir /video_recordings
sudo chmod -R 777 /video_recordings
sudo ufw limit ssh
sudo ufw allow 80
sudo ufw allow 1935
sudo ufw enable
