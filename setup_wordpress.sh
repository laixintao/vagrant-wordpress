#! /usr/bin/env bash

# follow DigitalOcean
# https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lemp-on-ubuntu-16-04

# download wordpress
cd /tmp
curl -O https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
mkdir /tmp/wordpress/wp-content/upgrade
rm -rf /var/www/html/*
sudo cp -a /tmp/wordpress/. /var/www/html

# config user permission
# use www-data to run
# in production enviroment, you should give this user minum permission

sudo chown -R www-data:www-data /var/www/html

# set the setgid bit on every directory in our WordPress installation
sudo find /var/www/html -type d -exec chmod g+s {} \;

# we'll give group write access to the wp-content directory so that the web interface can make theme and plugin changes
sudo chmod g+w /var/www/html/wp-content;
sudo chmod -R g+w /var/www/html/wp-content/themes
sudo chmod -R g+w /var/www/html/wp-content/plugins

# config wordpress database info
sudo sed -i "s/database_name_here/$DB/1" /var/www/html/wp-config.php
sudo sed -i "s/password_here/$PASSWD/1" /var/www/html/wp-config.php
sudo sed -i "s/username_here/$USER/1" /var/www/html/wp-config.php
rm -rf /tmp/wordpress
