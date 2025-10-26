#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo "$2 .. FAILED"
        exit 1
    else
        echo "$2 ..SUCCESS"
    fi
}
if [ $USERID -ne 0]
then
    echo "Please run the script with root access."
    exit 1
else
    echo "You are super user"
fi

dnf install mysql -y
VALIDATE $? "Installing MySql:"

dnf install git -y
VALIDATE $? "nstalling GIT"

