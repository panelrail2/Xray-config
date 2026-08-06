#!/bin/bash

set -e


XRAY_VERSION="26.6.1"


if command -v xray >/dev/null 2>&1
then

    echo "Xray already installed"

    exit 0

fi



echo "Installing Xray ${XRAY_VERSION}"



cd /tmp



wget -q \
https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/Xray-linux-64.zip \
-o xray.zip



mkdir -p /usr/local/bin/xray



unzip -o xray.zip \
-d /usr/local/bin/xray



ln -sf \
/usr/local/bin/xray/xray \
/usr/local/bin/xray



chmod +x /usr/local/bin/xray/xray



echo "Xray installation completed"
