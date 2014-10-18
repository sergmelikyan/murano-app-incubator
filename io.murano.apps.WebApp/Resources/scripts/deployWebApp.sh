#!/bin/bash
yum -y install httpd
echo "Instance: ${1}" > /var/www/html/index.html
systemctl start httpd
systemctl enable httpd
yum -y install firewalld
systemctl unmask firewalld
systemctl enable firewalld
systemctl start firewalld
firewall-cmd --permanent --add-service=http
firewall-cmd --reload
