#!/bin/bash
#byz!	test

scp -r ~/qq/project4-web.sh root@192.168.4.51:/root
ssh root@192.168.4.51 "bash ~/project4-web.sh"




scp -r ~/qq/project4-mariadb.sh root@192.168.4.52:/root
ssh root@192.168.4.52 "bash ~/project4-mariadb.sh"

