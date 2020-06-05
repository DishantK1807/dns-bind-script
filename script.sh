#!/bin/bash
echo "started"
sudo apt-get update -y
echo "updated"
sudo apt-get install bind9 bind9utils bind9-doc -y
echo "bind installed"
sudo sed -i 's/u bind/u bind -4/'  /etc/default/bind9
echo "replaced option"
sudo systemctl restart bind9
echo "restart bind"
sudo wget <path to s3 file (replace <>)> -O /etc/bind/named.conf.options
echo "download named.conf.options"
sudo wget <path to s3 file (replace <>)> -O /etc/bind/named.conf.local
echo "download named.conf.local"
sudo mkdir /etc/bind/zones
sudo wget <path to s3 file (replace <>)> -O /etc/bind/zones/db.us-east-2.compute.amazonaws.com
echo "downloaded db.compute:"
sudo wget <path to s3 file (replace <>)> -O /etc/bind/zones/db.172.31
echo "download db.ip"
sudo systemctl restart bind9
sudo ufw allow Bind9
echo "allow bind9"
sudo wget <path to s3 file (replace <>) > -O /etc/netplan/00-private-nameservers.yaml
echo "yaml downloaded"
sudo netplan apply
echo "Netplan Configuration Applied"
echo "Done!"