#!/bin/bash
set -e

source /etc/os-release
if (( VERSION_ID <= 10 ))
then
    service mysql start
else
    service mariadb start
fi


for service in ssh apache2 smbd
do
    service $service start
done

sleep infinity