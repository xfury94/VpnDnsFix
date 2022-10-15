#!/bin/bash

sed -i "/auth-user-pass/c\auth-user-pass pass" *.ovpn
sed -i 's|up /etc/openvpn/update-resolv-conf|up /etc/openvpn/vpnfailsafe.sh|g' *.ovpn
sed -i 's|down /etc/openvpn/update-resolv-conf|down up /etc/openvpn/vpnfailsafe.sh|g' *.ovpn
sed -i '/^down*/a down-pre' *.ovpn
sed -i '/^down-pre/a dhcp-option DOMAIN-ROUTE .' *.ovpn
