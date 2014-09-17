#!/bin/bash
# $1 = UI password


# Add Murano notification actions
cat commands_add.cfg >> /etc/nagios/objects/commands.cfg

#
cp -f murano_alarm.sh /usr/local/bin
chmod a+x /usr/local/bin/murano_alarm.sh


#Enable plugins
sudo chown nagios /usr/lib64/nagios/plugins/*
#setup UI password
rm -f /etc/nagios/passwd
sudo htpasswd -bc /etc/nagios/passwd nagiosadmin $1
service httpd restart
service nagios restart

