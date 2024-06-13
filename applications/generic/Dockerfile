ARG BASEIMAGE
ARG TAG

FROM ghcr.io/greenbone/vt-test-environments/${BASEIMAGE}:${TAG}
ARG UPDATED=true
ARG TAG

# Install dependencies
RUN apt-get update \
    && if [ "$UPDATED" = true ]; then apt-get upgrade -y; fi \
    && apt-get install -y apache2 php mariadb-server samba \
    && rm -rf /var/lib/apt/lists/*

# Configure Apache and PHP
RUN sed -i "/^expose_php/s/=.*/= On/" /etc/php/*/apache2/php.ini \
    && sed -i "/^ServerTokens/s/ .*/ Full/" /etc/apache2/conf-enabled/security.conf \
    && echo '<?php echo("test"); ?>' > /var/www/html/index.php

# Configure MariaDB
RUN sed -i "/^bind-address/s/= .*/= */" /etc/mysql/mariadb.conf.d/50-server.cnf \
    && service mariadb start || service mysql start \
    && echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;" | mysql

# Configure Samba
RUN sed -i "/^\[global\]/a\   server min protocol = NT1" /etc/samba/smb.conf

ADD init.sh /
CMD [ "/init.sh" ]

EXPOSE 80 445 3306
