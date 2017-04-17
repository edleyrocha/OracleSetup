#!/bin/bash
file="/etc/init.d/oracle"
if [ -f "$file" ]
then
	chkconfig --del oracle 
	mv /etc/init.d/oracle /etc/init.d/oracle.backup_$(date +%d-%m-%y__%H-%M-%S)
	echo "$File Backup Old"
	ln -s /home/oracle/scripts/oracle.sh /etc/init.d/oracle
	echo "$File Link Create /etc/init.d/oracle "
else
	ln -s /home/oracle/scripts/oracle.sh /etc/init.d/oracle
	echo "$File Link Create /etc/init.d/oracle "
fi
chmod 770 -R /home/oracle/scripts
chown oracle:root -R /home/oracle/scripts
chkconfig --add oracle
chkconfig --list
exit 0
