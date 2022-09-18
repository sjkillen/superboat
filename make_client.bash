#!/usr/bin/env bash
# Create a client .opvn with the name $1
# $1: client name

# Change into the directory of this script
# https://stackoverflow.com/questions/59895
cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1

NAME="$1"
if [[ -z "$NAME" ]]; then
    echo "Include NAME as an argument to this script"
    return
    exit
fi 


pushd easyrsa

if [[ -d clients/$NAME ]]; then
    echo "Client $NAME already exists, delete it? [y/N]"
    read WORD
    if [[ "$WORD" = "y" ]]; then
        echo "Deleting clients/$NAME..."
        rm -rf "clients/$NAME"
    else
        return
        exit
    fi
fi

mkdir -p "clients/$NAME"

./easyrsa build-client-full "$NAME" nopass
./easytls build-tls-crypt-v2-client server "$NAME"
./easytls inline-tls-auth "$NAME"

# cp "pki/private/$NAME.key" "clients/$NAME"
# cp "pki/issued/$NAME.crt" "clients/$NAME"
# cp "pki/ca.crt" "clients/$NAME"
# cp ../schema.ovpn "clients/$NAME/$NAME.ovpn"

# pushd "clients/$NAME"
#     echo "<ca>" >> "$NAME.ovpn"
#     cat ca.crt >> "$NAME.ovpn"
#     echo "</ca>" >> "$NAME.ovpn"

#     echo "<cert>" >> "$NAME.ovpn"
#     cat "$NAME.crt" >> "$NAME.ovpn"
#     echo "</cert>" >> "$NAME.ovpn"

#     echo "<key>" >> "$NAME.ovpn"
#     cat "$NAME.key" >> "$NAME.ovpn"
#     echo "</key>" >> "$NAME.ovpn"

#     echo "<tls-auth>" >> "$NAME.ovpn"
#     cat "../../ta.key" >> "$NAME.ovpn"
#     echo "</tls-auth>" >> "$NAME.ovpn"
# popd

popd
