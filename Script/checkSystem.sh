#!/bin/sh

set -x

# funtion check status. exit 0 -> success; exit 1 -> fail.
check_status()
{
   result=$?
   if [ $result -gt 0 ]; then
       exit 1
   fi
}

git --version
check_status

curl -V
check_status

if [ $1 -gt 0 ]; then
   docker version
   check_status
fi