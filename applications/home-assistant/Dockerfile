ARG BASEIMAGE=homeassistant/home-assistant
ARG TAG

FROM ${BASEIMAGE}:${TAG}
RUN apk del openssh-client \
    && apk add --no-cache openssh \
    && adduser -D demo \
    && echo "demo:demo" | chpasswd \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" \
    && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" \
    && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ""

COPY init.sh /bin/init.sh

CMD [ "/bin/init.sh" ]

EXPOSE 22
EXPOSE 8123
