#!/usr/bin/env bash
# Initialize private keys and such

# Change into the directory of this script
# https://stackoverflow.com/questions/59895
cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1

if [[ -d easyrsa/pki ]]; then
    echo "Delete pki and start fresh? [y/N]"
    read WORD
    if [[ "$WORD" = "y" ]]; then
        echo "Deleting easyrsa/pki..."
        rm -rf easyrsa/pki
    else
        return
        exit
    fi
fi

pushd easyrsa
    ./easyrsa init-pki
    echo "CA" | ./easyrsa build-ca nopass
    ./easyrsa build-serverClient-full CA nopass
    ./easyrsa gen-dh
popd

echo "ca \"$PWD/easyrsa/pki/ca.crt\"" > superboat.conf
echo "cert \"$PWD/easyrsa/pki/ca.crt\"" >> superboat.conf
echo "key \"$PWD/easyrsa/pki/private/ca.key\"" >> superboat.conf
echo "dh \"$PWD/easyrsa/pki/dh.pem\"" >> superboat.conf
echo "" >> superboat.conf
echo "port 1194" >> superboat.conf
echo "proto udp" >> superboat.conf
echo "proto udp6" >> superboat.conf
echo "dev tap" >> superboat.conf
echo "" >> superboat.conf
echo "user root" >> superboat.conf
echo "group root" >> superboat.conf
