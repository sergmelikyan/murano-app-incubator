#!/bin/bash

sed -i.bak "s/%IP%/$1/g" service-http.cfg
sed -i.bak "s/%HOST%/$2/g" service-http.cfg
sed -i.bak "s/%PORT%/$4/g" service-http.cfg
sed -i.bak "s/%URL%/$5/g" service-http.cfg

sed -i.bak "s/%IP%/$1/g" host-entry.cfg
sed -i.bak "s/%HOST%/$2/g" host-entry.cfg

cat host-entry.cfg >> /etc/nagios/conf.d/murano-entry.cfg
cat service-http.cfg >> /etc/nagios/conf.d/murano-entry.cfg

# Configure Murano endpoint info
echo "MURANO_ALARM_ENDPOINT=$3" > /etc/nagios/murano.sh

service nagios restart