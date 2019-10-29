#!/bin/bash
#byz!	project4-web
mysqldump wordpress > ~/wordpress.bak
scp ~/wordpress.bak root@192.168.4.52:/root
systemctl stop mariadb
systemctl disable mariadb
sed -ri "32s/192.168.4.51/192.168.4.52/" /usr/local/nginx/html/wp-config.php
