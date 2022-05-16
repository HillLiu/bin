#!/bin/bash

if [ "$(whoami)" != "root" ]; then
  echo "Sorry, you are not root."
  exit 1
fi

moreGroup=$2
user=$1

useradd $user
mkdir -p /home/$user/.ssh
chown -R $user:$user /home/$user
usermod --shell /bin/bash $user
if [ "$moreGroup" == "admin" ]; then
  gpasswd -a $user admin
fi
echo "Add User $user"
