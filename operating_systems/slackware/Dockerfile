ARG BASEIMAGE=vbatts/slackware
ARG TAG

FROM ${BASEIMAGE}:${TAG}
ARG UPDATED=true

RUN slackpkg update \
    # When updating, we need to upgrade slackpkg itself first. Otherwise upgrade-all will abort
    # We can skip this steps, if slackpkg or all packages are already up-to-date
    && if [ "$UPDATED" = true ]; then slackpkg upgrade slackpkg && slackpkg upgrade-all || true && slackpkg upgrade-all; fi \
    && slackpkg install openssh \
    && rm -rf /var/lib/slackpkg/* \
    && useradd demo \
    && echo "demo:demo" | chpasswd \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" \
    && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" \
    && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ""

CMD [ "/usr/sbin/sshd", "-D" ]

EXPOSE 22
