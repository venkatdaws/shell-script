#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

if [ $USERID -ne 0 ]
then
    echo -e "Please run with super user"
    exit 1
else
    echo "you are super user"
fi

dnf install mysql-server -y &>>LOGFILE
VALIDATE $? "Installing Mysqlserver"

systemctl enable mysqlid &>>LOGFILE
VALIDATE $? "Enabling the mysqlid"

systemctl start mysqlid &>>LOGFILE
VALIDATE $? "Starting the mysql"

mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
VALIDATE $? "Setting up root password"
