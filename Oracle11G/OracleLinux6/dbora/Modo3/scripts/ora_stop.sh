#!/bin/bash
# script to stop the Oracle database, listener and dbconsole
. ~/.bash_profile
# stop the Enterprise Manager db console
emctl stop dbconsole
# Stop Listener
lsnrctl stop
# Stop Database
sqlplus / as sysdba << EOF
SHUTDOWN IMMEDIATE;
EXIT;
EOF
#
exit 0
