#!/bin/bash

set -e


cd /opt/xray-config



echo "Installing Xray..."

bash scripts/install_xray.sh



echo "Generating config..."

bash scripts/generate_config.sh


bash scripts/start_xray.sh


exec gunicorn \
--bind 0.0.0.0:${PORT:-9000} \
app.app:app
