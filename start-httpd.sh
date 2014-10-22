#!/bin/bash

if [ -f /etc/sysconfig/httpd ]; then
       	. /etc/sysconfig/httpd
fi

# Start httpd in the C locale by default.
HTTPD_LANG=${HTTPD_LANG-"C"}




# This will prevent initlog from swallowing up a pass-phrase prompt if
# mod_ssl needs a pass-phrase from the user.
INITLOG_ARGS=""



httpd=${HTTPD-/usr/sbin/httpd}

$httpd -DFOREGROUND $OPTIONS

