apt update
apt install -y nginx
mkdir /var/cache/nginx

cd /root/nginx-hls-stream/cached

rm -rf /var/www/html/index.html
rm -rf /etc/nginx/nginx.conf
rm -rf /etc/nginx/sites-available/default

cp nginx.conf /etc/nginx/nginx.conf
cp default /etc/nginx/sites-available/default
cp index.html /var/www/html/index.html

sudo service nginx restart
