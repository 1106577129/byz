#!/bin/bash
#byz!	test

X=$1
cd /var/lib/libvirt/images
qemu-img create -f qcow2 -b .node_base.qcow2 $X.img

cp /var/lib/libvirt/images/.node_base.xml /etc/libvirt/qemu/$X.xml
#sed -ri "2s/.*/\<name\>$X\<\/name\>/" /etc/libvirt/qemu/$X.xml
#sed -ri "/source file/s@.*@\<source file\=\'\/var\/lib\/libvirt\/images\/$X.img\'\/\>@" /etc/libvirt/qemu/$X.xml
sed -i ""

virsh define /etc/libvirt/qemu/$X.xml
