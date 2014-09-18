#!/bin/bash

# This script is used by Nagios to post alerts into a Murano
# using the Incoming WebHooks integration.
#
# All variables that start with NAGIOS_ are provided by Nagios as
# environment variables when an notification is generated.
# A list of the env variables is available here:
#   http://nagios.sourceforge.net/docs/3_0/macrolist.html

source /etc/nagios/murano.sh

#MURANO_ALARM_ENDPOINT="http://muranoip:port/alarmURL"

case "$1" in
OK)
        # The service just came back up, so don't do anything...
        ;;
WARNING)
        # We don't really care about warning states, since the service is probably still running...
        ;;
UNKNOWN)
        # We don't know what might be causing an unknown error, so don't do anything...
        ;;
CRITICAL)
        # Aha!  The HTTP service appears to have a problem - perhaps we should restart the server...
        # Is this a "soft" or a "hard" state?
        case "$2" in
        SOFT)

                case "$3" in

                1)
                        #Notify murano
                        curl -X POST --data '{}' -H "Content-type: text/plain" $MURANO_ALARM_ENDPOINT
                        ;;
                        esac
                ;;

        HARD)
                #Notify Murano
                curl -X POST --data '{}' -H "Content-type: text/plain" $MURANO_ALARM_ENDPOINT
                ;;
        esac
        ;;
esac
exit 0