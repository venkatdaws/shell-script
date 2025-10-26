#!/bin/bash
USERID=$(id -u)
TMESTAMP=$DATE

if [USERID -ne 0]
then
    echo "Pls run the script with super user"
    exit 1
else
    echo "you are a super user"
fi

for i in $@
do
    echo "package to install: $1"
done