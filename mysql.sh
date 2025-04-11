#!/bin/bash

source ./common.sh

check_root

echo "please enter DB password:"
read -s mysql_root_password

<<<<<<< HEAD
dnf install mysql-servnmner -y &>>$LOGFILE
#VALIDATE $? "Installing MySQL Server"

systemctl enable mysqld &>>$LOGFILE
#VALIDATE $? "Enabling MySQL Server"

systemctl start mysqld &>>$LOGFILE
#VALIDATE $? "Starting MySQL Server"
=======
dnf install mysql-server -y &>>$LOGFILE
VALIDATE $? "Installing MySQL Server"

systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "Enabling MySQL Server"

systemctl start mysqld &>>$LOGFILE
VALIDATE $? "Starting MySQL Server"
>>>>>>> 73f83b7ce868af57976c393520430a23972d317a

# mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
# VALIDATE $? "Setting up root password"

#Below code will be useful for idempotent nature
mysql -h db.soumyadevops.space -uroot -p${mysql_root_password} -e 'show databases;' &>>$LOGFILE
if [ $? -ne 0 ]
then
    mysql_secure_installation --set-root-pass ${mysql_root_password} &>>$LOGFILE
<<<<<<< HEAD
    #VALIDATE $? "MySQL Root password Setup"
=======
    VALIDATE $? "MySQL Root password Setup"
>>>>>>> 73f83b7ce868af57976c393520430a23972d317a
else
    echo -e "MySQL Root password is already setup...$Y SKIPPING $N"
fi
