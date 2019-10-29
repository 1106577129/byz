#!/bin/bash
#byz	project4-mariadb
yum -y install mariadb mariadb-server mariadb-devel
systemctl restart mariadb
systemctl enable mariadb
mysql -e 'create database wordpress character set utf8mb4;'
mysql wordpress < ~/wordpress.bak
mysql -e "grant all on wordpress.* to wordpress@'%' identified by 'wordpress'";
mysql -e "flush privileges";
