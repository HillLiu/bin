#!/bin/bash

dockerOutput=/log/
output=/tmp/
scanUrl=$1

if [ -n "$2" ] ; then
  logFile=$2
  dockerOutput+=$logFile
  output+=$logFile
else
  hostname=`echo "$scanUrl" | awk -F/ '{print $3}'`
  logFile=wpscan-${hostname}.log
  dockerOutput+=$logFile
  output+=$logFile
fi

echo "Output: $output"
echo '' > $output

docker run -it -v /tmp:/log --rm wpscanteam/wpscan -o $dockerOutput --url $1

ansi2html $output $output.html

less -r $output
