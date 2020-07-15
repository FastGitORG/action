#!/bin/bash
#ghproxy daemon
#by Kevin Sanchez
#20200715 16:30 UTC+8

while :
do
    pid=`ps -ef|grep ghproxy|grep -v grep|awk '{print $2}'`
    if [ -n "$pid" ]
        ghproxy
    else
        sleep 30000 #sleep 5min
    fi
done
