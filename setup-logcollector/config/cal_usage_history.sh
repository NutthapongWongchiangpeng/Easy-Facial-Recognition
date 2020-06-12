#!/bin/bash
HOST="[WEB_HOST]/logyou/api/source/calculate/usage_history/"
USER="[WEB_USER]"
PASSWORD="[WEB_PASSWORD]"

curl -H "Content-Type: application/json" -H 'collector:1234567890' --user $USER:$PASSWORD -X POST $HOST
