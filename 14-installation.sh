#!/bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1 #failure is other than zero
fi

VALIDATE(){ #functions receive inputs through argus just like script argus
   if [ $1 -ne 0 ];then
      echo "ERROR:: Installing $2 is failure"
      exit 1
   else
      echo "Installing $2 is SUCCESS"
      exit 0

   fi
}

dnf install mysql -y
VALIDATE $? "MySQL

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install mongodb-mongosh -y
VALIDATE $? "mongosh"
