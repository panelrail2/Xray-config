#!/usr/bin/env bash


PORT=${PORT:-8080}


if command -v curl >/dev/null 2>&1; then


curl -fsS \
http://127.0.0.1:${PORT}/health \
>/dev/null

exit $?



else


echo "curl not installed"
exit 1



fi
