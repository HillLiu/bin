#!/bin/bash

if [ "$(whoami)" != "root" ]; then
  echo "Sorry, you are not root."
  exit 1
fi

group=$2

useradd $1
mkdir -p /home/$1/.ssh
chown -R $1:$1 /home/$1
usermod --shell /bin/bash $1
if [ "$group" == "admin" ]; then
  gpasswd -a $1 admin
fi
echo "Add User $1"
