#!/bin/bash
echo "Starting..."
echo ""
echo "Starting Oracle Databases: [  ] "
echo "########################################################################################################" >> /var/log/oracleService.log
date +"! %T %B (%d/%m/%Y) : Starting Oracle Databases [  ]" >> /var/log/oracleService.log

# script to start the Oracle database, listener and dbconsole
echo "" >> /var/log/oracleService.log
. ~/.bash_profile >> /var/log/oracleService.log
"" >> /var/log/oracleService.log
echo "bash_profile [OK]" >> /var/log/oracleService.log

# Start Database
echo "" >> /var/log/oracleService.log
sqlplus / as sysdba << EOF >> /var/log/oracleService.log
STARTUP;
EXIT;
EOF
echo "" >> /var/log/oracleService.log
echo "sqlplus [OK]" >> /var/log/oracleService.log

# Start Listener
echo "" >> /var/log/oracleService.log
lsnrctl start >> /var/log/oracleService.log
echo "" >> /var/log/oracleService.log
echo "lsnrctl [OK]" >> /var/log/oracleService.log

# start the Enterprise Manager db console
echo "" >> /var/log/oracleService.log
emctl start dbconsole >> /var/log/oracleService.log
echo "" >> /var/log/oracleService.log
echo "dbconsole [OK]" >> /var/log/oracleService.log

echo "" >> /var/log/oracleService.log
date +"! %T %B (%d/%m/%Y) : Starting Oracle Databases [OK]" >> /var/log/oracleService.log
echo "########################################################################################################" >> /var/log/oracleService.log
echo "Starting Oracle Databases: [OK] "
echo ""
touch /var/lock/subsys/dbora
#
exit 0
