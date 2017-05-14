#!/bin/bash
file="/etc/systemd/system/oracle.service"
if [ -f "$file" ]
then
	systemctl stop oracle.service
	systemctl disable oracle.service
	systemctl daemon-reload
	rm -rf /etc/systemd/system/oracle.service
	ls /etc/systemd/system/multi-user.target.wants/ -lha
	echo "$File Remove Old"
else
	echo "$File Service not Exist /etc/systemd/system/oracle.service"
fi
exit 0
