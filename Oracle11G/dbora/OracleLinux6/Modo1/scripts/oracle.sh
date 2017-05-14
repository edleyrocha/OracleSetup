#!/bin/bash
# chkconfig: 345 99 10
# /etc/init.d/oracle
# description: Oracle auto start-stop script.
# processname: oracle
# description: start and stop Oracle Database Enterprise Edition on Oracle Linux 5 and 6
#
#
# ORACLE 11G R2 BY HERRY 15_04_2017
# Note: Change the value of ORACLE_HOME to specify the correct Oracle home
# directory for your installation.
#          
export ORA_HOME=/u01/app/oracle/product/11.2.0.4/db_1
export ORACLE_UNQNAME=oracledb
export ORA_OWNER=oracle
 
start(){
	echo "Starting..."
	echo ""
	echo "Starting Oracle Databases: [  ] "
	echo "--------------------------------------------------------------------------------------------------------" >> /var/log/oracleService.log
	date +"! %T %B (%d/%m/%Y) : Starting Oracle Databases [  ]" >> /var/log/oracleService.log
	echo " " >> /var/log/oracleService.log
	su - $ORA_OWNER -c "$ORA_HOME/bin/dbstart $ORA_HOME" >> /var/log/oracleService.log
	echo " " >> /var/log/oracleService.log
	su - $ORA_OWNER -c "$ORA_HOME/bin/emctl start dbconsole" >> /var/log/oracleService.log
	echo " " >> /var/log/oracleService.log
	date +"! %T %B (%d/%m/%Y) : Starting Oracle Databases [OK]" >> /var/log/oracleService.log
	echo "--------------------------------------------------------------------------------------------------------" >> /var/log/oracleService.log
	echo "Starting Oracle Databases: [OK] "
	echo ""
	touch /var/lock/subsys/dbora
}
 
stop(){
	echo "Stopping..."
	echo ""
	echo "Stopping Oracle Databases: [  ] "
	echo "--------------------------------------------------------------------------------------------------------" >> /var/log/oracleService.log
	date +"! %T %B (%d/%m/%Y) : Stopping Oracle Databases [  ]" >> /var/log/oracleService.log
	echo " " >> /var/log/oracleService.log
	su - $ORA_OWNER -c "$ORA_HOME/bin/emctl stop dbconsole" >> /var/log/oracleService.log
	echo " " >> /var/log/oracleService.log
	su - $ORA_OWNER -c "$ORA_HOME/bin/dbshut $ORA_HOME" >> /var/log/oracleService.log
	echo " " >> /var/log/oracleService.log
	date +"! %T %B (%d/%m/%Y) : Stopping Oracle Databases [OK]" >> /var/log/oracleService.log
	echo "--------------------------------------------------------------------------------------------------------" >> /var/log/oracleService.log
	echo "Stopping Oracle Databases: [OK] "
	echo ""
	rm -f /var/lock/subsys/dbora
}
 
restart(){
   stop
   start
}
 
usage(){
   echo "usage: $0 {start|stop|restart}"
}
 
case $1 in
   'start') start;;
   'stop') stop;;
   'restart') restart;;
   *) usage;;
esac
exit 0
#FIM
