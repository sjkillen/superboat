# superboat
Tools to build and access the ultimate hacker intranet

## Configuration
- IP addresses must be set in schema.conf
- Working directorys must be changed in superboat_vpn.service

## Set up VPN
1. Run install_deps.bash
1. Run init.bash
1. For each client, run "$ ./make_client.bash client_name"
1. Start VPN with "$ openvpn superboat.conf"
1. Connect a client (Running on separate machine than the VPN) with "$ openvpn client.ovpn"

## Extra info
- Main gateway is usually 10.0.0.1
- ipp.txt tracks IP addresses (usually increments of 1)

# Autostart
- Add the service `sudo cp superboat_vpn.service /etc/systemd/system/`
- Enable it `sudo systemctl enable superboat_vpn.service`
- Start it (alternatively reboot) `sudo systemctl start superboat_vpn.service`
- View logs to see if startup was successful `sudo systemctl status superboat_vpn.service`

### Resources
- https://steamforge.net/wiki/index.php/How_to_configure_OpenVPN_to_resolve_local_DNS_%26_hostnames
- Routing addresses
- https://openvpn.net/community-resources/how-to/
- https://openvpn.net/community-resources/ethernet-bridging/