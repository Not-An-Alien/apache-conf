#!/bin/bash
echo "Please enter the password of the og box"
read ogPass
echo "Please enter the password of the new box"
read newPass
echo "please enter the ip of the original box"
read ogIP
echo "Please enter the ip of the new box"
read newIP
echo "enter the name of the original boxes database"
read oldDB 
echo "enter the name of the new boxes database" 
read newDB 
echo "scping everything over to the new box!"
sudo sshpass -p$newPass scp -r /var/www/html root@$newIP:/var/www/
echo "scp complete"
echo "Starting database dump"
mysqldump -u root -p$ogPass $oldDB | mysql -h $newIP -u rvadmin -p$newPass avidcollectiondb
echo "dumpComplete"

