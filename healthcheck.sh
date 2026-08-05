#!/bin/bash


if pgrep xray > /dev/null

then

exit 0

else

exit 1

fi
