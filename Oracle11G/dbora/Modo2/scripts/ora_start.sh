#!/bin/bash
# script to start the Oracle database, listener and dbconsole
. ~/.bash_profile
# start the listener and the database
$ORACLE_HOME/bin/dbstart $ORACLE_HOME
# start the Enterprise Manager db console
$ORACLE_HOME/bin/emctl start dbconsole
exit 0
