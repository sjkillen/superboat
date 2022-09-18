#!/usr/bin/env bash
# Initialize private keys and such

# Good guide
# https://community.openvpn.net/openvpn/wiki/EasyRSA3-OpenVPN-Howto


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

# Easy RSA stuff
pushd easyrsa
    ./easyrsa init-pki
    echo "CA" | ./easyrsa build-ca nopass
    ./easyrsa build-server-full server nopass
    ./easyrsa gen-dh
popd

# Easy TLS things
pushd easyrsa
    ./easytls init-tls
    ./easytls build-tls-auth
    ./easytls build-tls-crypt
    ./easytls build-tls-crypt-v2-server server
    ./easytls inline-tls-auth server
popd

# Make superboat.conf
cat schema.conf ./easyrsa/pki/easytls/server.inline > superboat.conf
