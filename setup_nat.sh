#!/bin/bash

ip link set up dev enp4s0f0
ip addr add 192.168.1.2/24 dev enp4s0f0
sysctl net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o eno1 -j MASQUERADE
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i enp4s0f0 -o eno1 -j ACCEPT
