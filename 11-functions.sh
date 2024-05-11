#! bin/bash
USERID=$[id -u]

if [ $USERID -ne 0 ]
then
echo "please user the super user access"
exit 1
esle
echo "you are super user"
fi

dnf install mysql -y
if [ $? -ne 0 ]
then
echo " installation of mysql failed.."
exit 1
esle
echo "installation of mysql was success"
fi

dnf install git -y
if [ $? -ne 0 ]
then
echo "Installation of git failed--"
esle
echo "Installation of git success"
fi

echo "Is script still running"

