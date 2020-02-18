#!/bin/sh

if [ "$(whoami)" != "root" ]; then
    echo "Sorry, you are not root."
    exit 1
fi

launchctl stop com.apple.usbd
launchctl start com.apple.usbd
