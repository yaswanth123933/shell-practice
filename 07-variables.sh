#!/bin/bash

#DATE=$(date)

START_TIME=$(date +%s)

sleep 10

END_TIME=$(date +%S)
TOTAL_TIME=$(($END_TIME-$START_TIME))

echo "Timestamp executed: $TOTAL_TIME Seconds"