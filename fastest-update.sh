#!/bin/bash

sed -i "/auth-user-pass/c\auth-user-pass pass" *.ovpn
sed -i '/^auth-user-pass*/a script-security 2' *.ovpn
sed -i '/^auth-user-pass*/a up /usr/bin/update-systemd-resolved' *.ovpn
sed -i '/^auth-user-pass*/a down /usr/bin/update-systemd-resolved' *.ovpn
sed -i '/^down*/a down-pre' *.ovpn
sed -i '/^down-pre/a dhcp-option DOMAIN-ROUTE .' *.ovpn
