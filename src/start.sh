#!/bin/bash
# Run the script after start

# Run socat
nohup socat TCP4-LISTEN:22,reuseaddr,fork TCP4:github.com:22 >> socat.log 2>&1 &

# Run ghproxy
nohup go run ./ghproxy/ghproxy.go &