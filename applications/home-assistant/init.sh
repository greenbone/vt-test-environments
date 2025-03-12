#!/bin/sh

/usr/sbin/sshd -D &

if [ -f "/usr/local/bin/hass" ]; then
  /usr/local/bin/hass &
else
  cd /usr/src/app && python -m homeassistant --config /config;
fi
wait
