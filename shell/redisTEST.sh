#!/bin/bash
#byz!	test
for i in  {51..57} 
do
scp -r /linux-soft/03/redis/redis-4.0.8.tar.gz root@192.168.4.$i:/root
scp ~/byz/shell/redisCluster1.sh root@192.168.4.$i:/root
scp ~/byz/shell/redisCluster2.sh root@192.168.4.$i:/root
done

for i in {51..57}
do
ssh root@192.168.4.$i "bash ~/redisCluster1.sh"
ssh root@192.168.4.$i "bash ~/redisCluster2.sh"
done
