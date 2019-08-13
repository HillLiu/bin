#!/bin/bash

if [ "$(whoami)" != "root" ]; then
    echo "Sorry, you are not root."
    exit 1
fi

IP_SAVE="/sbin/iptables-save"
IP_RESTORE="/sbin/iptables-restore"
IP_SAVE_FILE="/dev/shm/iptables.save"
IPTABLES="/home/sys/bin/iptable-util"
MY_HOST=`hostname | awk -F. '{print $1}'`
MY_IPTABLES="/home/sys/bin/support/myip_${MY_HOST}.sh"

echo "Stop all dokku--- Begin -->"
sudo dokku ps:stopall
echo "Stop all dokku--- End --/>"
sleep 3;

if [[ -x "$IPTABLES" && -x "$MY_IPTABLES" ]]; then
	$IPTABLES --stop
fi

echo "Restart Docker --- Begin -->"
systemctl restart docker.service
echo "Restart Docker --- End --/>"

echo "Start all dokku--- Begin -->"
sudo dokku ps:startall
echo "Start all dokku--- End --/>"
sleep 3;

echo "Cleanup dokku--- Begin -->"
sudo dokku cleanup
echo "Cleanup dokku--- End --/>"

if [ -x "$IP_SAVE" ]; then
	$IP_SAVE > $IP_SAVE_FILE 
fi

if [ -x "$MY_IPTABLES" ]; then
	$MY_IPTABLES 
fi

if [[ -e $IP_SAVE_FILE && -x $IP_RESTORE ]]; then
	$IP_RESTORE < $IP_SAVE_FILE
fi
