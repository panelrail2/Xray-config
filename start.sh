#!/bin/bash

echo "Starting Xray..."

exec /usr/local/bin/xray run -config /etc/xray/config.json
