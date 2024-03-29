#!/bin/bash

if [ "$(whoami)" != "root" ]; then
    echo "Sorry, you are not root."
    exit 1
fi

IPTABLES="/home/sys/bin/iptable-util"
MY_HOST=`hostname | awk -F. '{print $1}'`
MY_IPTABLES="/home/sys/bin/support/myip_${MY_HOST}.sh"

echo "Stop all dokku--- Begin -->"
sudo dokku ps:stop --all
echo "Stop all dokku--- End --/>"
sleep 3;

if [[ -x "$IPTABLES" && -x "$MY_IPTABLES" ]]; then
	$IPTABLES --stop
fi

echo "Restart Docker --- Begin -->"
systemctl restart docker.service
echo "Restart Docker --- End --/>"

echo "Start all dokku--- Begin -->"
sudo dokku ps:start --all
echo "Start all dokku--- End --/>"
sleep 3;

echo "Cleanup dokku--- Begin -->"
sudo dokku cleanup
echo "Cleanup dokku--- End --/>"

if [[ -x "$IPTABLES" && -x "$MY_IPTABLES" ]]; then
        $IPTABLES --save
	$MY_IPTABLES 
fi
