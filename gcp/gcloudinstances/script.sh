#!/bin/bash
yum install puppet
echo "$(getent hosts puppet-master | cut -d " " -f 1) puppetserver" >> /etc/hosts
cp /tmp/puppet.conf /etc/puppet/puppet.conf
systemctl start puppet
puppet agent -t 
