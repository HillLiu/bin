#!/bin/bash

remote=$1

if [ -z "$remote" ]; then
  echo "Need provide remote server";
  exit 1
fi

ssh $remote mkdir -p ./.ssh ./.vim/autoload
scp $HOME/.ssh/authorized_keys $remote:./.ssh
scp $HOME/.vim/autoload/plug.vim $remote:./.vim/autoload/
scp $HOME/.bash_profile $HOME/.vimrc $HOME/.screenrc $remote:./
