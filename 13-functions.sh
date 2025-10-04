#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1 #failure is other than zero
fi

dnf install mysql -y

if [ $? -ne 0 ];then
    echo "ERROR:: Installing mysql is failure"
    exit 1
else
    echo "Installing mysql is SUCCESS"
    exit 0

fi

dnf install nginx -y

if [ $? -ne 0 ];then
    echo "ERROR:: Installing nginx is failure"
    exit 1
else
    echo "Installing nginx is SUCCESS"
    exit 0

fi

dnf install mongodb-mongosh -y

if [ $? -ne 0 ];then
    echo "ERROR:: Installing mongodb-mongosh is failure"
    exit 1
else
    echo "Installing mongodb-mongosh is SUCCESS"
    exit 0

fi

#Actual commands are 3 ,but it is a lenghtly script i.e if condition block is repeated  3 times .so it's better to use the functions