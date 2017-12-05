#!/bin/sh

echo "Start installing nginx"

apt-get install -y nginx
sudo mv /tmp/wordpress_nginx.conf /etc/nginx/sites-available/default

systemctl reload nginx
