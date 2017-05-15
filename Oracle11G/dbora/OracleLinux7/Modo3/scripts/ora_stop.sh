#!/bin/bash
# script to stop the Oracle database, listener and dbconsole
. ~/.bash_profile
# Stop Database
sqlplus / as sysdba << EOF
SHUTDOWN IMMEDIATE;
EXIT;
EOF
# stop the Enterprise Manager db console
emctl stop dbconsole
# Stop Listener
lsnrctl stop
exit 0
