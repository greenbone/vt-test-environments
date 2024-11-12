ARG BASEIMAGE=docker.io/library/oraclelinux
ARG TAG

FROM ${BASEIMAGE}:${TAG}
ARG UPDATED=false

RUN if [ "$UPDATED" = true ]; then yum upgrade -y && yum clean all; fi \
    && useradd demo \
    && echo "demo" | passwd --stdin demo \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" \
    && (ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" || true) \
    && (ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" || true)

CMD [ "/usr/sbin/sshd", "-D" ]

EXPOSE 22
