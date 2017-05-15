#!/bin/bash
# chkconfig: 345 99 10
# /etc/init.d/oracle
# description: Oracle auto start-stop script.
# processname: oracle
# Set ORA_OWNER to the user id of the owner of the
# Oracle database in ORA_HOME.
 
ORA_OWNER=oracle
RETVAL=0
case "$1" in
    'start')
        # Start the Oracle databases:
        # The following command assumes that the oracle login
        # will not prompt the user for any values
		echo "Starting..."
		echo ""
		echo "Starting Oracle Databases: [  ] "
		echo "########################################################################################################" >> /var/log/oracleService.log
		date +"! %T %B (%d/%m/%Y) : Starting Oracle Databases [  ]" >> /var/log/oracleService.log
		echo " " >> /var/log/oracleService.log
        su - $ORA_OWNER -c "/home/oracle/scripts/ora_start.sh" >> /var/log/oracleService.log
		echo " " >> /var/log/oracleService.log
		date +"! %T %B (%d/%m/%Y) : Starting Oracle Databases [OK]" >> /var/log/oracleService.log
		echo "########################################################################################################" >> /var/log/oracleService.log
		echo "Starting Oracle Databases: [OK] "
		echo ""
		touch /var/lock/subsys/dbora
        ;;
    'stop')
        # Stop the Oracle databases:
        # The following command assumes that the oracle login
        # will not prompt the user for any values
		echo "Stopping..."
		echo ""
		echo "Stopping Oracle Databases: [  ] "
		echo "########################################################################################################" >> /var/log/oracleService.log
		date +"! %T %B (%d/%m/%Y) : Stopping Oracle Databases [  ]" >> /var/log/oracleService.log
		echo " " >> /var/log/oracleService.log
        su - $ORA_OWNER -c "/home/oracle/scripts/ora_stop.sh" >> /var/log/oracleService.log
		echo " " >> /var/log/oracleService.log
		date +"! %T %B (%d/%m/%Y) : Stopping Oracle Databases [OK]" >> /var/log/oracleService.log
		echo "########################################################################################################" >> /var/log/oracleService.log
		echo "Stopping Oracle Databases: [OK] "
		echo ""
		rm -f /var/lock/subsys/dbora
        ;;
    'restart')
        # Stop and Start the Oracle databases:
        # The following command assumes that the oracle login
        # will not prompt the user for any values
        echo ""
        echo "Restarting Oracle Databases..."
        /etc/init.d/oracle stop
        /etc/init.d/oracle start
        ;;
    *)
        echo $"Usage: $0 {start|stop|restart}"
        RETVAL=1
esac
exit $RETVAL
