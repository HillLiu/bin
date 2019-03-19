#!/bin/bash

dockerOutput=/log/
output=/tmp/

if [ -n "$2" ] ; then
  dockerOutput+=$2
  output+=$2
else
  dockerOutput+=wpscan.log
  output+=wpscan.log
fi

echo "Output: $output"
echo '' > $output

docker run -it -v /tmp:/log --rm wpscanteam/wpscan -o $dockerOutput --url $1
less -r $output
