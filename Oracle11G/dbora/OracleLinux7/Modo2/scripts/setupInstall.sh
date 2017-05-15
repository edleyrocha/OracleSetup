#!/bin/bash
file="/etc/systemd/system/oracle.service"
if [ -f "$file" ]
then
	systemctl stop oracle.service
	systemctl disable oracle.service
	#Removed symlink /etc/systemd/system/multi-user.target.wants/oracle.service.
	rm -rf /etc/systemd/system/oracle.service
	echo "$Deleted File /etc/systemd/system/oracle.service"
	cp /home/oracle/scripts/oracle.service.sh /etc/systemd/system/oracle.service
	echo "$File Create /etc/systemd/system/oracle.service"
else
	cp /home/oracle/scripts/oracle.service.sh /etc/systemd/system/oracle.service
	echo "$File Create /etc/systemd/system/oracle.service"
fi
touch /var/log/oracleService.log
chmod 777 /var/log/oracleService.log
chmod 770 -R /home/oracle/scripts
chown oracle:root -R /home/oracle/scripts
chmod u+x -R /home/oracle/scripts/
systemctl daemon-reload
systemctl enable oracle.service
ls /etc/systemd/system/multi-user.target.wants/ -lha
echo "Oracle.Service [" $(systemctl is-enabled oracle.service) "]"
#Created symlink from /etc/systemd/system/multi-user.target.wants/oracle.service to /etc/systemd/system/oracle.service.
exit 0
