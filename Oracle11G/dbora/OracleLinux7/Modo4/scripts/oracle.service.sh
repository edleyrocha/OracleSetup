[Unit]
Description=The Oracle Database Service
#Requires=rpc-statd.service network.target nfs.service nfs-mountd.service local-fs.target remote-fs.target
#After=syslog.target network.target

[Service]
# systemd ignores PAM limits, so set any necessary limits in the service.
# Not really a bug, but a feature.
# https://bugzilla.redhat.com/show_bug.cgi?id=754285
LimitMEMLOCK=infinity
LimitNOFILE=65535

#Type=simple
# idle: similar to simple, the actual execution of the service binary is delayed
#       until all jobs are finished, which avoids mixing the status output with shell output of services.
#Type=idle
Type=simple 
RemainAfterExit=yes
User=oracle
Group=root
#Environment="ORA_HOME=/u01/app/oracle/product/11.2.0.4/db_1"  
ExecStart=/home/oracle/scripts/ora_start.sh
ExecStop=/home/oracle/scripts/ora_stop.sh
#
# SERVICE
# systemctl start oracle.service
# systemctl stop oracle.service
# systemctl status oracle.service
#

# LOG
# tail -f /var/log/oracleService.log
#
# tail -f /u01/app/oracle/product/11.2.0.4/db_1/shutdown.log
# tail -f /u01/app/oracle/product/11.2.0.4/db_1/startup.log
[Install]
WantedBy=multi-user.target
