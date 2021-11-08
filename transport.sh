#!/bin/bash
sudo apt install sshpass -y 
echo "Please enter the db user of the og box"
read ogUser
echo "Please enter the db user of the new box"
read newUser
echo "Please enter the db password of the og box"
read ogPass
echo "Please enter the db password of the new box"
read newDBpass
echo "Please enter the root password of the new box"
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
sudo sshpass -p$newPass scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -r /var/www/html root@$newIP:/var/www/
echo "scp complete"
echo "Starting database dump"
mysqldump -u $ogUser -p$ogPass $oldDB | mysql -h $newIP -u $newUser -p$newDBpass $newDB
echo "dumpComplete"

