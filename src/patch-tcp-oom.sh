#!/bin/bash
#TCP Stack OutOfMemory Exception Fixer
#by Kevin
#thanks to 'Hello World!'(also called Bluefat)

#if network are in abnormal rate of throughput
#and /var/log/messages has lots of TCP: out of memory -- consider tuning tcp_mem
#try to apply this patch

echo "[+] Set env"
procPath=/etc/sysctl.conf

echo "[+] Patch $procPath"
echo "net.core.netdev_max_backlog=30000" >> $procPath
echo "net.core.rmem_max=134217728" >> $procPath
echo "net.core.wmem_max=134217728" >> $procPath
echo "net.ipv4.tcp_max_syn_backlog=8192" >> $procPath
echo "net.ipv4.tcp_rmem=4096 87380 671088646" >> $procPath
echo "net.ipv4.tcp_wmem=4096 87380 671088646" >> $procPath

echo "[+] Apply patch"
sudo /sbin/sysctl -p

echo "[x] All things finished! If patch isn't be applied, please reboot manually!"
