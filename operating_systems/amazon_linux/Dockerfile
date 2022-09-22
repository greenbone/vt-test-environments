ARG BASEIMAGE=amazonlinux
ARG TAG

FROM ${BASEIMAGE}:${TAG}
ARG UPDATED=true

RUN if [ "$UPDATED" = true ]; then yum upgrade -y; fi \
    && yum install -y openssh-server passwd \
    && yum clean all \
    && useradd demo \
    && echo "demo" | passwd --stdin demo \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" \
    && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" \
    && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" \
    # Explicitly enable PasswordAuthentication
    && sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/" /etc/ssh/sshd_config

CMD [ "/usr/sbin/sshd", "-D" ]

EXPOSE 22
