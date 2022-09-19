#!/usr/bin/env bash

sudo systemctl disable --now systemd-resolved
# Removes old DNS entries. Using Google as a backup DNS I guess
sudo echo "nameserver 127.0.0.1" > /etc/resolv.conf
sudo echo "nameserver 8.8.8.8" >> /etc/resolv.conf
sudo apt-get install dnsmasq dnsutils ldnsutils -y
