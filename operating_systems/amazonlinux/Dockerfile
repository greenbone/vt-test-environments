ARG BASEIMAGE=docker.io/library/amazonlinux
ARG TAG

FROM ${BASEIMAGE}:${TAG}
ARG UPDATED=false

RUN if [ "$UPDATED" = true ]; then yum upgrade -y; fi \
    && yum install -y openssh-server passwd \
    && yum clean all \
    && useradd demo \
    && echo "demo" | passwd --stdin demo \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" \
    && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" \
    && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" \
    # Explicitly enable PasswordAuthentication
    && sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/" /etc/ssh/sshd_config \
    # Work around PAM authentication failures in containers
    && if [ -d /etc/ssh/sshd_config.d ]; then echo "UsePAM no" > /etc/ssh/sshd_config.d/01-disable-usepam.conf; \
    else sed -i "s/UsePAM yes/UsePAM no/" /etc/ssh/sshd_config; fi

CMD [ "/usr/sbin/sshd", "-D" ]

EXPOSE 22
