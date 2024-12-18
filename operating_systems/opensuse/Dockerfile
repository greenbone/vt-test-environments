ARG BASEIMAGE=opensuse/leap
ARG TAG=latest

FROM ${BASEIMAGE}:${TAG}
ARG UPDATED=false

RUN if [ "$UPDATED" = true ]; then zypper refresh && zypper update -y; fi \
    && zypper install -y openssh shadow \
    && zypper clean \
    && useradd -m demo \
    && echo "demo:demo" | chpasswd \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" \
    && (ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" || true) \
    && (ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" || true) \
    && [ ! -f /etc/ssh/sshd_config ] && /usr/sbin/sshd -t || true \
    && touch /etc/ssh/sshd_config \
    && echo "PasswordAuthentication yes" >> /etc/ssh/sshd_configc

CMD [ "/usr/sbin/sshd", "-D" ]

EXPOSE 22
