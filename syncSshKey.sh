#!/bin/bash

remote=$1
ssh $remote mkdir -p ./.ssh
scp $HOME/.ssh/authorized_keys $remote:./.ssh
scp .bash_profile $remote:./
