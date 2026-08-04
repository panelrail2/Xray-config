#!/usr/bin/env bash


set -e


echo "================================"
echo "Railway Container Starting"
echo "================================"


export PORT=${PORT:-8080}


echo "PORT=$PORT"


mkdir -p /tmp/app


exec /app/start.sh
