#!/bin/bash
#byz!	project2

echo '[Unit]
Description=The Nginx HTTP Server
#描述信息
After=network.target remote-fs.target nss-lookup.target
#指定启动nginx之前需要其他的其他服务，如network.target等
[Service]
Type=forking
#Type为服务的类型，仅启动一个主进程的服务为simple，需要启动若干子进程的服务为forking
ExecStart=/usr/local/nginx/sbin/nginx
#设置执行systemctl start nginx后需要启动的具体命令.
ExecReload=/usr/local/nginx/sbin/nginx -s reload
#设置执行systemctl reload nginx后需要执行的具体命令.
ExecStop=/bin/kill -s QUIT ${MAINPID}
#设置执行systemctl stop nginx后需要执行的具体命令.
[Install]
WantedBy=multi-user.target' > /usr/lib/systemd/system/nginx.service



sed -i "45s/index  index.html index.htm;/index  index.php index.html index.htm;/" /usr/local/nginx/conf/nginx.conf
sed -ri "65,71s/#//" /usr/local/nginx/conf/nginx.conf
sed -ri "69s/^/#/" /usr/local/nginx/conf/nginx.conf
sed -ri "70s/fastcgi_params;/fastcgi.conf;/" /usr/local/nginx/conf/nginx.conf

systemctl restart mariadb
mysql -e "create database wordpress character set utf8mb4";
mysql -e "grant all on wordpress.* to wordpress@localhost identified by 'wordpress'";
mysql -e "grant all on wordpress.* to wordpress@192.168.4.51 identified by 'wordpress'";
mysql -e "flush privileges";
systemctl restart nginx
systemctl restart php-fpm
systemctl enable nginx
systemctl enable mariadb
systemctl enable php-fpm





















