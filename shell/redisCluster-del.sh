#!/bin/bash
#byz!	test
sed -ri  "815s/^/# /"   /etc/redis/6379.conf
sed -ri  "823s/^/# /"  /etc/redis/6379.conf
sed -ri  "829s/^/# /" /etc/redis/6379.conf
#sed -ri  "829s/1//" /etc/redis/6379.conf
#/etc/init.d/redis_6379 restart
rm -rf /var/lib/redis/6379/*
xxx=`ifconfig eth0 | head -2 | awk '/ine/{print $2}'`
aaa=`echo $xxx | awk -F"." '{print $4}'`
redis-cli -h $xxx -p 63$aaa shutdown
/etc/init.d/redis_6379 start

ss -nutlp | grep redis-server
