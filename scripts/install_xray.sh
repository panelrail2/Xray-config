#!/bin/bash

set -e


XRAY_VERSION="26.6.1"


if command -v xray >/dev/null 2>&1
then

    echo "Xray already installed"

    xray version

    exit 0

fi


echo "Installing Xray-core ${XRAY_VERSION}"



cd /tmp



ARCHIVE="Xray-linux-64.zip"



DOWNLOAD_URL="https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/${ARCHIVE}"



wget -q \
"${DOWNLOAD_URL}" \
-O "${ARCHIVE}"



mkdir -p /usr/local/share/xray



unzip -o \
"${ARCHIVE}" \
-d /usr/local/share/xray



install -m 755 \
/usr/local/share/xray/xray \
/usr/local/bin/xray



echo "Xray installed:"


xray version
