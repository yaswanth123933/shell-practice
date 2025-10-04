#!/bin/bash

echo "All variables passed to the script: $@"
echo "All variables passed to the script: $*"
echo "script name: $0"
echo "current directory: $PWD"
echo "who is runningthis: $USER"
echo "Home directory of user: $HOME"
echo "PID of the script: $$"
sleep 50 &
echo "PID of the last command in background is: $!"