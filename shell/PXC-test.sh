#!/bin/bash
#byz	test
read -p "IP: " IPx
for i in $IPx
do
  scp -r /linux-soft/03/PXC root@192.168.4.$i:/root
  scp -r ~/byz/shell/PXC-1.sh root@192.168.4.$i:/root
done



for i in $IPx
do
  ssh root@192.168.4.$i "bash ~/PXC-1.sh"
done

