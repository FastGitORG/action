#!/bin/bash
#iptables by @wloot & @KevinZonda
#To process GitHub.com SSH

YourIP=0.0.0.0
YourPort=22
TargetIP="github.com"
TargetPort=22

iptables -t nat -A PREROUTING --dst $YourIP -p tcp --dport $YourPort -j DNAT \
--to-destination $TargetIP:$TargetPort

iptables -t nat -A POSTROUTING -p tcp --dst $TargetIP --dport $TargetPort -j SNAT \
--to-source $YourIP

iptables -t nat -A OUTPUT --dst $YourIP -p tcp --dport $YourPort -j DNAT \
--to-destination $TargetIP:$TargetPort

systemctl save iptables
