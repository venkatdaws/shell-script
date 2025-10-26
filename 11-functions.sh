#!/bin/bash
USERID=$(id -u)

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo " $2 .... FAILURE"
        exit 1
    else
        echo "$2 ... Success"
}

if [$USERID -ne 0]
then
    echo "pls run as super user"
    exit 1
else
    echo "You are a super user"
fi

dnf install mysql -y
VALIDATE $? "Installing Mysql"

dnf install git -y
VALIDATE $? "Installing Git"