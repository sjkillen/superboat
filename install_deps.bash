#!/usr/bin/env bash
# Install dependencies for Ubuntu (may be incomplete)

# Change into the directory of this script
# https://stackoverflow.com/questions/59895
cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1

sudo apt install openvpn easy-rsa ufw

mkdir -p easyrsa
ln -s /usr/share/easy-rsa/* easyrsa
sudo ufw allow 1194
