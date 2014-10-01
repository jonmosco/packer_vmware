#!/bin/sh -x

sleep 30

/bin/mkdir -p /mnt/cdrom
/bin/mount -o loop /home/vagrant/linux.iso /mnt/cdrom
/bin/tar zxf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp/
/tmp/vmware-tools-distrib/vmware-install.pl --default
/bin/rm /home/vagrant/linux.iso
/bin/umount /mnt/cdrom
/bin/rmdir /mnt/cdrom
