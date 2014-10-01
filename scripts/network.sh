#!/bin/sh
# Make networking work!

IFCONFIG=`cat <<-END
DEVICE="eth0"
NM_CONTROLLED="no"
ONBOOT="yes"
BOOTPROTO="dhcp"
`

UDEV=`cat <<-END
SUBSYSTEM=="net", ACTION=="add", DRIVERS="?*", ATTR{type}=="1", KERNEL=="eth*", NAME="eth0"
`

echo "$IFCONFIG" > /etc/sysconfig/network-scripts/ifcfg-eth0
echo "$UDEV" > /etc/udev/rules.d/70-persistent-net.rules
