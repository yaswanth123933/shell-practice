#!/bin/bash

USERID=$(id -u)
 R="\e[31m"
 G="\e[32m"
 Y="\e[33m"
 N="\e[0m"
 LOGS_FOLDER="/var/log/shell-script"
 SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1 #failure is other than zero
fi

VALIDATE(){ #functions receive inputs through argus just like script argus
   if [ $1 -ne 0 ];then
      echo -e "Installing $2 ... $R FAILURE $N" | tee -a $LOG_FILE

      exit 1
   else
      echo -e "Installing $2 ... $G SUCCESS $N" | tee -a $LOG_FILE


   fi
}

dnf list installed mysql &>>LOG_FILE
#install if it is not found
if [ $? -ne 0 ]; then
    dnf install mysql -y  &>>LOG_FILE
    VALIDATE $? "MySQL"
else
    echo -e "MySQL already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE

fi

dnf list installed nginx  &>>LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y  &>>LOG_FILE
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE

fi

dnf list installed python3  &>>LOG_FILE
if [ $? -ne 0 ]; then
    dnf install "python3" -y &>>LOG_FILE 
    VALIDATE $? "python3"
else
    echo -e "Python3 already exist ... $Y SKIPPING $N" | tee -a $LOG_FILE
 
fi
