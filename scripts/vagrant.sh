#!/bin/sh

# Create the vagrant user and group
#/usr/sbin/groupadd vagrant
#/usr/sbin/useradd vagrant -g vagrant -G wheel
#echo "vagrant"|passwd --stdin vagrant

# Add the user to sudo and configure sudo
#echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
#chmod 0440 /etc/sudoers.d/vagrant
#sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
sed -i "s/^\(.*env_keep = \"\)/\1PATH /" /etc/sudoers

# Get the vagrant ssh key
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

sed -i "s/^#UseDNS no/UseDNS no/" /etc/ssh/sshd_config
#echo "UseDNS no" >> /etc/ssh/sshd_config
