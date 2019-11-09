#!/bin/bash
#byz	TEST

yum -y install php-devel gcc

tar -zxf redis-cluster-4.3.0.tgz
cd redis-4.3.0/

phpize
./configure --with-php-config=/usr/bin/php-config
make && make install

sed -ri  '728s@.*@extension_dir = "/usr/lib64/php/modules"@' /etc/php.ini
sed -ri  '730s@.*@extension = "redis.so"@' /etc/php.ini
systemctl restart php-fpm
php -m | grep -i redis

