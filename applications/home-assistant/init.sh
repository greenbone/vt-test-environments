#!/bin/sh

/usr/sbin/sshd -D &
/usr/local/bin/hass &
wait
