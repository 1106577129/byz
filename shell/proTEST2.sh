#!/bin/bash
#byz!   test
read -p "IP: " IPx
for i in $IPx
do
  scp -r ~/qq/project2.sh root@192.168.4.$i:/root
done



for i in $IPx
do
  ssh root@192.168.4.$i "bash ~/project2.sh"
done

