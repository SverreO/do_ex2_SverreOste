#!/usr/bin/env bash
apt-get update
sudo apt-get -y install ansible sshpass

ln -sf /vagrant/hosts /etc/ansible/hosts


KNOW_HOSTS_FILE="/home/vagrant/.ssh/known_hosts"

echo $KNOW_HOSTS_FILE

rm /home/vagrant/.ssh/known_hosts

ssh-keyscan 192.168.2.3 >> $KNOW_HOSTS_FILE 
ssh-keyscan 192.168.2.4 >> $KNOW_HOSTS_FILE 
ssh-keyscan 192.168.2.5 >> $KNOW_HOSTS_FILE
ssh-keyscan 192.168.2.6 >> $KNOW_HOSTS_FILE
ssh-keyscan localhost >> $KNOW_HOSTS_FILE 
chown vagrant:vagrant $KNOW_HOSTS_FILE 

#!not getting hosts working without .ini
#!ansible adding -i /etc/ansible/hosts.ini
#finaly changed it in the cfg file
sudo cp -f /etc/ansible/hosts /etc/ansible/hosts.ini
sudo chmod -x /etc/ansible/hosts.ini

sudo rm /etc/ansible/ansible.cfg
sudo ln -sf /vagrant/Config/ansible.cfg /etc/ansible/ansible.cfg