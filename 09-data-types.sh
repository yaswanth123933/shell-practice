#!/bin/bash

NUMBER1=100 #everything in shell is considered as string
NUMBER2=200
NAME=DevOps

SUM=$(($NUMBER1+$NUMBER2+$NAME))

echo "Sum is: ${SUM}"