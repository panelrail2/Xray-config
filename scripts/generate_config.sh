#!/bin/bash

set -e


mkdir -p /etc/xray/cert


if [ ! -f /etc/xray/cert/fullchain.pem ]
then

openssl req \
-x509 \
-newkey rsa:2048 \
-nodes \
-keyout /etc/xray/cert/private.key \
-out /etc/xray/cert/fullchain.pem \
-days 3650 \
-subj "/CN=${DOMAIN:-localhost}"

fi



export UUID

export XHTTP_PATH=${XHTTP_PATH:-/xhttp}



envsubst \
< config/config.json.template \
> config/config.json
