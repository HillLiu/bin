#!/bin/bash

remote=$1

if [ -z "$remote" ]; then
  echo "Need provide remote server";
  exit 1
fi

ssh $remote mkdir -p ./.ssh
scp $HOME/.ssh/authorized_keys $remote:./.ssh
scp $HOME/.bash_profile $remote:./
