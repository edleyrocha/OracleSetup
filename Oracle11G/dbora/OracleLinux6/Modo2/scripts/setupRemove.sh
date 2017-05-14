#!/bin/bash
file="/etc/init.d/oracle"
if [ -f "$file" ]
then
	chkconfig --del oracle 
	rm -rf /etc/init.d/oracle
	rm -rf /home/oracle/scripts 
	echo "$File Remove Old"
else
	echo "$File Service not Exist /etc/init.d/oracle "
fi
exit 0
