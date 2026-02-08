#!/bin/bash
for service in "$@"
do
  if systemctl is-active --quiet "$service"; 
  then
      echo "$service OK"
  else
      echo "$service FAILED"
  fi
done





# Output:
# nginx FAILED
# docker OK
# git FAILED