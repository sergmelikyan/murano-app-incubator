#!/bin/bash
# Install Apache WebSerber
yum -y install httpd

# Add HTML Page with machine ID
echo "Instance: ${1}" > /var/www/html/index.html

# Restart Apache to apply changes
systemctl start httpd
systemctl enable httpd

# Install and configure local firewall
yum -y install firewalld
systemctl unmask firewalld
systemctl enable firewalld
systemctl start firewalld
firewall-cmd --permanent --add-service=http
firewall-cmd --reload
