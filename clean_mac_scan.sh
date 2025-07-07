#!/bin/bash

SUBNET="192.168.1.0/24"

echo "======================================================"
echo "     Connected Devices (IP + MAC)"
echo "======================================================"
printf "%-16s %-20s %-30s\n" "IP" "MAC" "Vendor"
echo "------------------------------------------------------"

# print your own device
MY_IP=$(hostname -I | awk '{print $1}')
MY_MAC=$(ip link show | awk '/ether/ {print $2}' | head -n 1)
printf "%-16s %-20s %-30s\n" "$MY_IP" "$MY_MAC" "(This Device)"

# then scan the network
sudo nmap -sn $SUBNET | awk '
/Nmap scan report/ {ip=$5}
/MAC Address/ {printf "%-16s %-20s %-30s\n", ip, $3, substr($0,index($0,$4))}
'

