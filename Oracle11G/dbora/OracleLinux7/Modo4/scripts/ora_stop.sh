#!/bin/bash
echo "Stopping..."
echo ""
echo "Stopping Oracle Databases: [  ] "
echo "########################################################################################################" >> /var/log/oracleService.log
date +"! %T %B (%d/%m/%Y) : Stopping Oracle Databases [  ]" >> /var/log/oracleService.log

# script to stop the Oracle database, listener and dbconsole
echo "" >> /var/log/oracleService.log
. ~/.bash_profile >> /var/log/oracleService.log
"" >> /var/log/oracleService.log
echo "bash_profile [OK]" >> /var/log/oracleService.log


# Stop Database
echo "" >> /var/log/oracleService.log
sqlplus / as sysdba << EOF >> /var/log/oracleService.log
SHUTDOWN IMMEDIATE;
EXIT;
EOF
echo "" >> /var/log/oracleService.log
echo "sqlplus [OK]" >> /var/log/oracleService.log

# stop the Enterprise Manager db console
echo "" >> /var/log/oracleService.log
emctl stop dbconsole >> /var/log/oracleService.log
echo "" >> /var/log/oracleService.log
echo "dbconsole [OK]" >> /var/log/oracleService.log

# Stop Listener
echo "" >> /var/log/oracleService.log
lsnrctl stop >> /var/log/oracleService.log
echo "" >> /var/log/oracleService.log
echo "lsnrctl [OK]" >> /var/log/oracleService.log

echo " " >> /var/log/oracleService.log
date +"! %T %B (%d/%m/%Y) : Stopping Oracle Databases [OK]" >> /var/log/oracleService.log
echo "########################################################################################################" >> /var/log/oracleService.log
echo "Stopping Oracle Databases: [OK] "
echo ""
rm -f /var/lock/subsys/dbora
exit 0
