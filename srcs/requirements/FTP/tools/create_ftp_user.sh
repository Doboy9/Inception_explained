#!/bin/bash

# Create FTP user
useradd -m -d /var/www/html -s /bin/bash ftpuser
echo "ftpuser:ftppassword" | chpasswd

# Start vsftpd
/usr/sbin/vsftpd /etc/vsftpd.conf