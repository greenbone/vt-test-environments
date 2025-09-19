ARG BASEIMAGE=docker.io/alpine
ARG TAG=3.22
ARG UPDATED=false

FROM ${BASEIMAGE}:${TAG}

# default shell location: /bin/ash
RUN if [ "$UPDATED" = true ]; then apk update && apk upgrade ; fi \
    && apk add openssh-server \
    && adduser -S demo -s /bin/sh \
    && echo "demo:demo" | chpasswd \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" \
    && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" \
    && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" 


CMD [ "/usr/sbin/sshd", "-D" ]

EXPOSE 22
