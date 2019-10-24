#!/bin/bash
#byz!	redis Cluster
#scp -r student@192.168.4.254:/linux-soft/03/redis/redis-4.0.8.tar.gz  /root

#安装依赖
yum -y install gcc
cd ~/
#解包 安装
tar -xf redis-4.0.8.tar.gz
cd ~/redis-4.0.8 && make && make install
#更改 redis 初始化文件 并初始化
sed -ri "1,150s/read -p/echo ok #read -p/"  /root/redis-4.0.8/utils/install_server.sh
sed -ri "1,150s/read  -p/echo ok #read -p/"  /root/redis-4.0.8/utils/install_server.sh
/root/redis-4.0.8/utils/install_server.sh
#更改 redis 文件 IP地址 端口号 并启动
xxx=`ifconfig eth0 | head -2 | awk '/inet/{print $2}'`
sed -ri "/^bind/s/127.0.0.1/$xxx/" /etc/redis/6379.conf
aaa=`echo $xxx | awk -F"." '{print $4}'`
sed -ri "/^port/s/6379/63$aaa/" /etc/redis/6379.conf
#/etc/init.d/redis_6379 stop
/etc/init.d/redis_6379 start
#查看状态
netstat -nutlp | grep redis-server






