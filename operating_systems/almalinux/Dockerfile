ARG BASEIMAGE=docker.io/library/almalinux
ARG TAG

FROM ${BASEIMAGE}:${TAG}
ARG UPDATED=false
ARG TAG

# Lock releasever to the tag to pin the minor release
RUN echo "${TAG}" > /etc/yum/vars/releasever \
    && if [ "$UPDATED" = true ]; then dnf upgrade -y; fi \
    && dnf install -y openssh-server \
    && dnf clean all \
    && useradd demo \
    && echo "demo:demo" | chpasswd \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" \
    && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" \
    && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" \
    # Workaround to fix SSH login (see VTA-641)
    && if [ -d /etc/ssh/sshd_config.d ]; then echo "UsePAM no" > /etc/ssh/sshd_config.d/01-disable-usepam.conf; \
    else sed -i "s/UsePAM yes/UsePAM no/" /etc/ssh/sshd_config; fi

CMD [ "/usr/sbin/sshd", "-D" ]

EXPOSE 22
