ARG BASEIMAGE=vulhub/weblogic
ARG TAG=12.2.1.3-2018

FROM ${BASEIMAGE}:${TAG}
ARG UPDATED=false

USER root

RUN if [ "$UPDATED" = true ]; then yum upgrade -y; fi \
    && yum install -y passwd openssh-server \
    && yum clean all \
    && useradd demo \
    && echo "demo" | passwd --stdin demo \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" \
    && (ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" || true) \
    && (ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" || true)

COPY init.sh /bin/init.sh

CMD [ "/bin/init.sh" ]

EXPOSE 22
EXPOSE 7001
