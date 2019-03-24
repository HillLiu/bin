#!/bin/bash

if [ "$(whoami)" != "root" ]; then
    echo "Sorry, you are not root."
    exit 1
fi
sudo dokku ps:stopall
sleep 3;
systemctl restart docker.service
sleep 3;
sudo dokku ps:startall
