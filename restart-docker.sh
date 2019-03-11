#!/bin/bash

if [ "$(whoami)" != "root" ]; then
    echo "Sorry, you are not root."
    exit 1
fi

systemctl restart docker.service
