#!/bin/bash
#byz!	test
read -p "IP: " IPx
for i in $IPx
do
  scp -r /linux-soft/02/lnmp_soft.tar.gz root@192.168.4.$i:/root
  scp -r ~/qq/project1.sh root@192.168.4.$i:/root
done



for i in $IPx
do
  ssh root@192.168.4.$i "bash ~/project1.sh"
done
