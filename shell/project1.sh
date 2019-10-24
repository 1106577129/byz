#!/bin/bash
#byz!	project1

yum -y install gcc openssl-devel pcre-devel mariadb mariadb-server mariadb-devel php php-mysql php-fpm 


cd ~/
tar -xf lnmp_soft.tar.gz
cd lnmp_soft/
tar -xf nginx-1.12.2.tar.gz
cd nginx-1.12.2/
useradd -s /bin/nologin nginx
./configure \
--user=nginx --group=nginx \
--with-http_ssl_module \
--with-http_stub_status_module

make && make install















