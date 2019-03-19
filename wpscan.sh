#!/bin/bash

output=/log/

if [ -n "$2" ] ; then
  output+=$2
else
  output+=wpscan.log
fi

echo "Output: $output"

docker run -it -v /tmp:/log --rm wpscanteam/wpscan -o $output --url $1
