#!/bin/bash

##
# Start the script which watches and rebuilds on .adoc file changes.
#
./watch.sh &

sleep 3

##
# Starts the local http server on the build directory.
#
( cd build && python3 -m http.server -b 127.0.0.1 3003 )
