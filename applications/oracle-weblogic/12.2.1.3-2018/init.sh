#!/bin/sh

/usr/sbin/sshd -D &
/u01/oracle/createAndStartEmptyDomain.sh
wait
