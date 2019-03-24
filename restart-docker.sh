#!/bin/bash

if [ "$(whoami)" != "root" ]; then
    echo "Sorry, you are not root."
    exit 1
fi

echo "Stop all dokku--- Begin -->"
sudo dokku ps:stopall
echo "Stop all dokku--- End --/>"
sleep 3;

echo "Restart Docker --- Begin -->"
systemctl restart docker.service
echo "Restart Docker --- End --/>"
sleep 3;

echo "Start all dokku--- Begin -->"
sudo dokku ps:startall
echo "Start all dokku--- End --/>"
