#!/bin/bash

if [ -f "/etc/debian_version" ]; then
  apt-get update
  if [ $? = 100 ]; then
    sed -i "s/deb.debian.org/archive.debian.org/" /etc/apt/sources.list && \
    apt-get update;
  fi

  if [ "$UPDATED" = true ]; then
    apt-get upgrade -y;
  fi

  apt-get install --no-install-recommends -y openssh-server && \
  rm -rf /var/lib/apt/lists/* && \
  useradd demo && \
  echo "demo:demo" | chpasswd && \
  mkdir -p /var/run/sshd/; \
elif [ -f "/etc/alpine-release" ]; then
  apk del openssh-client && \
  apk add --no-cache openssh && \
  adduser -D demo && \
  echo "demo:demo" | chpasswd && \
  ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" && \
  ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" && \
  ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ""; \
else \
  echo "Unknown base OS"
  exit 1
fi
