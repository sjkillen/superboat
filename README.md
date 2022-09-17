# superboat
Tools to build and access the ultimate hacker intranet

## Set up VPN
1. Run install_deps.bash
1. Run init.bash
1. For each client, run "$ ./make_client.bash client_name"
1. Start VPN with "$ openvpn --config superboat.conf"
1. Connect a client (Running on separate machine than the VPN) with "$ openvpn --config client.ovpn"

## TODO
- fix the .conf file to have more stuff
- Figure out how to generate CA files properly? Unsupported purpose?

### Resources
- https://steamforge.net/wiki/index.php/How_to_configure_OpenVPN_to_resolve_local_DNS_%26_hostnames
