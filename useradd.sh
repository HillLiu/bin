#!/bin/bash

# curl https://raw.githubusercontent.com/HillLiu/bin/master/useradd.sh | sudo --preserve-env=SSH_AUTH_SOCK env PATH=$PATH bash -s -- [user] [group]


if [ "$(whoami)" != "root" ]; then
  echo "Sorry, you are not root."
  exit 1
fi

moreGroup=$2
user=$1

if [ -z "$user" ]; then
  echo "User account should not empty."
  exit 2
fi

useradd $user
mkdir -p /home/$user/.ssh
chown -R $user:$user /home/$user
usermod --shell /bin/bash $user
if [ "$moreGroup" == "admin" ]; then
  gpasswd -a $user admin
fi
echo "Add User $user"
