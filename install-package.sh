#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ...$R FAILURE"
        exit 1
    else
        echo -e "$2... $G SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Pls run with sudo user"
    exit 1
else
    echo "You are a super user"
fi

for i in $@
do
    echo "package to install: $i"
    dnf list installed $i &>>LOGFILE
    if [ $? -eq 0 ]
    then
        echo -e "$i is already instaled ...$Y SKIPPING $N"
    else
        dnf install $i -y &>>LOGFILE
        VALIDATE $? "Installaton of : $i"
    fi
done