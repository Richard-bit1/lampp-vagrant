#!/usr/bin/env bash
set -xeu

chown -R www-data:www-data /var/www/html 
chmod -R 755 /var/www/html
cp -vf /vagrant/files/info.php /var/www/html/test.php

systemctl enable --now apache2
systemctl enable --now mariadb