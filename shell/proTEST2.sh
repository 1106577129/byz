#!/bin/bash
#byz!   test
read -p "IP: " IPx
for i in $IPx
do
  scp -r ~/byz/shell/project2.sh root@192.168.2.$i:/root
done



for i in $IPx
do
  ssh root@192.168.2.$i "bash ~/project2.sh"
done

