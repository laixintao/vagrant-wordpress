#! /usr/bin/env bash

echo "Start installing mysql."

export DEBIAN_FRONTEND="noninteractive"

debconf-set-selections <<< "mysql-server mysql-server/root_password password ${SUPER_PASSWORD}"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password ${SUPER_PASSWORD}"

apt-get install -y mysql-server

mysql -u root "-p${SUPER_PASSWORD}" -e "CREATE DATABASE ${DB} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
GRANT ALL ON ${DB}.* TO '${USER}'@'localhost' IDENTIFIED BY '${PASSWD}';
FLUSH PRIVILEGES;"
