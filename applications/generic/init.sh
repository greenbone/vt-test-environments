#!/bin/bash
set -e

source /etc/os-release
# In Debian 10 and Ubuntu 20.10 or earlier the init file is called differently
if [ "$NAME" = "Debian" ] && dpkg --compare-versions "$VERSION_ID" le 10 \
    || [ "$NAME" = "Ubuntu" ] && dpkg --compare-versions "$VERSION_ID" le 20.10
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