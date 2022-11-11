#!/bin/sh

cd ~
apt update && apt upgrade 

echo "Setup PHP..."

# https://tecadmin.net/how-to-install-php-on-ubuntu-22-04/
apt install software-properties-common ca-certificates lsb-release apt-transport-https unzip
apt install -y software-properties-common
# LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
add-apt-repository ppa:ondrej/php
apt update
apt install php8.0 -y
apt install php8.0-{common,gd,opcache,cli,bz2,fpm,curl,intl,bcmath,redis,mbstring,zip,mysql,readline,xml,sqlite3,xdebug} php-sqlite3 openssl -y
php -v
php -m
php -m | grep sqlite

echo "Setting up composer..."

cd ~
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo $HASH
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

echo "Install Valet..."

cd ~
composer global require cpriego/valet-linux
