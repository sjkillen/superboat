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
    openvpn --genkey tls-auth ta.key
    sudo useradd superboatvpn
popd

