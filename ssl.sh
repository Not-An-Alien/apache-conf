#!/bin/bash
sudo apt-get install openssl -y 

country=US
state=Georgia
locality=Atlanta
organization=Rearview
organizationalunit=IT
email=Hosting@rvadv.com

openssl req -nodes -newkey rsa:2048 -keyout /etc/ssl/private/private.key -out /etc/ssl/private/request.csr \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"

openssl x509 -in /etc/ssl/private/request.csr -out /etc/ssl/private/certificate.crt -req -signkey 
/etc/ssl/private/private.key -days 365