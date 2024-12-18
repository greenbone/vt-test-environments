ARG BASEIMAGE=docker.io/opensuse/leap
ARG TAG=latest

FROM ${BASEIMAGE}:${TAG}
ARG UPDATED=false

RUN if [ "$UPDATED" = true ]; then zypper refresh && zypper update -y; fi \
    && zypper install -y openssh \
    && zypper clean \
    && useradd -m demo \
    && echo "demo:demo" | chpasswd \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" \
    && (ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" || true) \
    && (ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" || true)

CMD [ "/usr/sbin/sshd", "-D" ]

EXPOSE 22