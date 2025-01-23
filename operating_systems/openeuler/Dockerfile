ARG BASEIMAGE=docker.io/openeuler/openeuler
ARG TAG

FROM ${BASEIMAGE}:${TAG}
ARG UPDATED=false
ARG TAG

RUN if [ "$UPDATED" = true ]; then dnf upgrade -y; fi \
    && if [ "$TAG" != "20.03-lts" ]; then dnf install -y openssh-server; fi \
    && dnf clean all \
    && useradd demo \
    && echo "demo:demo" | chpasswd \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" \
    && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" \
    && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ""

CMD [ "/usr/sbin/sshd", "-D" ]

EXPOSE 22
