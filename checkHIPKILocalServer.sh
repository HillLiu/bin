lsof -n -i4TCP:61161 | grep LISTEN | awk '{print $2}'