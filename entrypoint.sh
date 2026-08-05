#!/bin/bash

set -e


echo "Generating Xray config"

python3 /scripts/generate_config.py


echo "Testing Xray config"

/xray/xray test \
-config /config/config.json


echo "Starting Xray"


/xray/xray run \
-config /config/config.json &



echo "Starting Web Service"


exec gunicorn \
--bind 0.0.0.0:${PORT} \
app.app:app
