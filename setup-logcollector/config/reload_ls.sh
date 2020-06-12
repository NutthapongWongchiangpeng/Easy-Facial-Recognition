#!/bin/bash
# LS_PID=`ps -aux | grep logstash | head -n 1 | awk '{print $2}'`
# kill -1 $LS_PID
# echo "SIGHUP $LS_PID logstash"
RELOAD_FILE="/etc/logstash/conf.d/logstash-syslog.conf"
sed -i "s/####/###/g" $RELOAD_FILE
sleep 5
sed -i "s/###/####/g" $RELOAD_FILE
