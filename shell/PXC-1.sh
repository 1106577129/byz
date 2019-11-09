#!/bin/bash
#byz!	test
cd ~/PXC
tar -xf Percona-XtraDB-Cluster-5.7.25-31.35-r463-el7-x86_64-bundle.tar
rpm -ivh qpress-1.1-14.11.x86_64.rpm
rpm -ivh libev-4.15-1.el6.rf.x86_64.rpm
yum -y install percona-xtrabackup-24-2.4.*
yum -y install Percona-XtraDB-Cluster-*.rpm

x1=`ifconfig eth0 | head -2 | awk '/ine/{print $2}'`
x2=`echo $x1 | awk -F"." '{print $4}'`
sed -ri "/server-id/s/.*/server-id=$x2/" /etc/percona-xtradb-cluster.conf.d/mysqld.cnf

sed -ri "/wsrep_cluster_address=/s/$/192.168.4.66,192.168.4.10/" /etc/percona-xtradb-cluster.conf.d/wsrep.cnf
sed -ri "/wsrep_node_address=/s/.*/wsrep_node_address=192.168.4.$x2/" /etc/percona-xtradb-cluster.conf.d/wsrep.cnf
sed -ri "/wsrep_node_name=/s/.*/wsrep_node_name=server$x2/" /etc/percona-xtradb-cluster.conf.d/wsrep.cnf
sed -ri "/wsrep_sst_method/s/.*/wsrep_sst_method=\"sstuser:123qqq...A\"/" /etc/percona-xtradb-cluster.conf.d/wsrep.cnf





systemctl start mysql
systemctl enable mysql
