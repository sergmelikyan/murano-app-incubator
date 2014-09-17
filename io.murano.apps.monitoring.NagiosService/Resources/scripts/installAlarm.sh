#!/bin/bash
# $1 = UI password


# Add Murano notification actions
cat commands_add.cfg >> /etc/nagios/objects/commands.cfg

#
cp -f murano_alarm.sh /usr/local/bin
chmod a+x /usr/local/bin/murano_alarm.sh


#Enable plugins
chown nagios /usr/lib64/nagios/plugins/*
#setup UI password
rm -f /etc/nagios/passwd
/usr/bin/htpasswd -bc /etc/nagios/passwd nagiosadmin $1

cd /etc/nagios
sed -i.bak "s/interval_length=60/interval_length=5/g" nagios.cfg
service httpd restart
service nagios restart

