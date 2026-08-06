#!/bin/bash

set -e


xray run \
-config /opt/xray-config/config/config.json \
> /var/log/xray.log 2>&1 &


sleep 3


if ! pgrep xray
then

cat /var/log/xray.log

exit 1

fi


nginx -g "daemon on;"
