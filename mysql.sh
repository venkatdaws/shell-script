#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

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
    echo -e "Please run with super user"
    exit 1
else
    echo "you are super user"
fi

dnf install mysql-server -y &>>LOGFILE
VALIDATE $? "Installing Mysqlserver"

systemctl enable mysqld &>>LOGFILE
VALIDATE $? "Enabling the mysqlid"

systemctl start mysqld &>>LOGFILE
VALIDATE $? "Starting the mysql"

mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
VALIDATE $? "Setting up root password"
