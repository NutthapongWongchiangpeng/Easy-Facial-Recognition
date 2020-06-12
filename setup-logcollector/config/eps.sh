#!/bin/bash

# previous=`curl localhost:9600/_node/stats/events?pretty | jq '.events.in'`
# sleep 1
# current=`curl localhost:9600/_node/stats/events?pretty | jq '.events.in'`
# echo $((current-previous))

LS_PIPELINE_NUM=3
previous=`curl localhost:9600/_node/stats/events`
previous_in="$(echo ${previous} | jq '.events.in')"
previous_out="$(echo ${previous} | jq '.events.out')"
while :
do
        sleep 1
        current=`curl localhost:9600/_node/stats/events`
        current_in="$(echo ${current} | jq '.events.in')"
        current_out="$(echo ${current} | jq '.events.out')"
        echo "In = "$((current_in/LS_PIPELINE_NUM - previous_in/LS_PIPELINE_NUM))
        echo "Out = "$((current_out/LS_PIPELINE_NUM - previous_out/LS_PIPELINE_NUM))
        previous_in=$current_in
        previous_out=$current_out
done
