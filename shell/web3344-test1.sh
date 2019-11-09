#!/bin/bash
#byz	test

read -p "IP: " IP 
for i in $IP
do
	scp ~/桌面/redis-cluster-4.3.0.tgz root@192.168.4.$i:~/
	scp /root/byz/shell/web3344-1.sh root@192.168.4.$i:~/
done 


for i in $IP
do

	ssh root@192.168.4.$i "bash ~/web3344-1.sh"

done

