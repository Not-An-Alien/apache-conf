#!/bin/bash
echo "Please enter ip of this server "
read ServerIp
echo "ServerName $ServerIp" >> /etc/apache2/sites-available/default-ssl.conf
echo "SSLCertificateFile /etc/ssl/private/certificate.crt" >> /etc/apache2/sites-available/default-ssl.conf
echo "SSLCertificateKeyFile /etc/ssl/private/private.key" >> /etc/apache2/sites-available/default-ssl.conf
a2ensite default-ssl.conf
echo "Virtual host for 443 set"
echo "Virtual host for 443 set"
echo "Adding Redirect to https "
echo "Redirect \"/" "https://$ServerIp/" >> /etc/apache2/sites-available/000-default.conf
echo "Redirect Added!"
sudo a2enmod ssl
sudo a2enmod headers
sudo systemctl reload apache2
