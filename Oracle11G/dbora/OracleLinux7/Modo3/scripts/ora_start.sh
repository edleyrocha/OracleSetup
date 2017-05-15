#!/bin/bash
# script to start the Oracle database, listener and dbconsole
. ~/.bash_profile
# Start Database
sqlplus / as sysdba << EOF
STARTUP;
EXIT;
EOF
# Start Listener
lsnrctl start
# start the Enterprise Manager db console
emctl start dbconsole
#
exit 0
