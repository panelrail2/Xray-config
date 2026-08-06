#!/bin/bash


curl -f \
http://127.0.0.1:${PORT:-9000}/health \
|| exit 1
