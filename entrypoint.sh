#!/bin/bash

set -e


cd /opt/xray-config


bash scripts/install_xray.sh


bash scripts/generate_config.sh


bash scripts/start_xray.sh


exec gunicorn \
--bind 0.0.0.0:${PORT:-9000} \
app.app:app
