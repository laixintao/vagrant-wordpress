#! /usr/bin/env bash

echo "Start installing PHP"

apt-get install -y php-curl php-gd php-mbstring php-mcrypt php-xml php-xmlrpc php-fpm php-mysql
systemctl restart php7.0-fpm
