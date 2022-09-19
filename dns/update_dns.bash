#!/usr/bin/env bash
# Update from ../ipp.txt every 5 seconds
# Needs sudo
# Assumes that openvpn is running as a service that puts ipp.txt in /ipp.txt

# Change into the directory of this script
# https://stackoverflow.com/questions/59895
cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1

while true; do
    cp ./hosts_schema /etc/hosts
    paste <(cut -f2 -d"," /ipp.txt)  <(cut -f1 -d"," /ipp.txt) >> /etc/hosts
    # paste <(cut -f2 -d"," /ipp.txt)  <(cut -f1 -d"," /ipp.txt | xargs printf "%s.superboat\n") >> /etc/hosts
    sleep 5
done
