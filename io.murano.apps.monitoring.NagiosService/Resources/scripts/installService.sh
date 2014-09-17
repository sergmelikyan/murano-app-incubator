#!/bin/bash

sed -i.bak "s/%IP%/$1/g" murano-entry.cfg
sed -i.bak "s/%HOST%/$2/g" murano-entry.cfg

cp -f murano-entry.cfg /etc/nagios/conf.d

# Configure Murano endpoint info
echo "MURANO_ALARM_ENDPOINT=$3" > /etc/nagios/murano.sh

service nagios restart