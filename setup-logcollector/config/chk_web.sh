#!/bin/bash

WEB_HOST="http://localhost:8001"
STATUS_CODE=`curl -i $WEB_HOST | head -n 1 | cut -d ' ' -f 2`
echo $STATUS_CODE

ARRAY_STATUS_CODE=( "200" "304" "404" )
if [[ ! " ${ARRAY_STATUS_CODE[@]} " =~ " ${STATUS_CODE} " ]]; then
        sudo systemctl restart logyou
fi

# WEB_HOST="https://localhost"
# STATUS_CODE=`curl -i $WEB_HOST | head -n 1 | cut -d ' ' -f 2`
# echo $STATUS_CODE

# ARRAY_STATUS_CODE=( "200" "304" "404" "302" )
# if [[ ! " ${ARRAY_STATUS_CODE[@]} " =~ " ${STATUS_CODE} " ]]; then
#         sudo systemctl restart nginx
# fi
