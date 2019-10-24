#!/bin/bash
#byz!	test
for i in  58 59 
do
scp -r /linux-soft/03/redis/redis-4.0.8.tar.gz root@192.168.4.$i:/root
scp /home/student/shell/redisCluster.sh root@192.168.4.$i:/root
scp /home/student/shell/redisCluster2.sh root@192.168.4.$i:/root
done

for i in 58 59
do
ssh root@192.168.4.$i "bash ~/redisCluster.sh"
ssh root@192.168.4.$i "bash ~/redisCluster2.sh"
done
