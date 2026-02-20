ARG BASEIMAGE
ARG TAG

FROM ${BASEIMAGE}:${TAG}
ARG UPDATED=false
ARG TAG

RUN if [ "$UPDATED" = true ]; then \
    # Pinning minor version is impossible because of missing separate repository.
    # Workaround: Exclude release files (e.g. /etc/os-release)
    # for RHEL 7 and RHEL 8 or higher, respectively
    yum upgrade -y --exclude redhat-release-server --exclude redhat-release; fi \
    && yum install -y openssh-server \
    && yum clean all \
    && useradd demo \
    && echo "demo" | passwd --stdin demo \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" \
    && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" \
    && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" \
    # Workaround to fix SSH login (see VTA-641)
    && if [ -d /etc/ssh/sshd_config.d ]; then echo "UsePAM no" > /etc/ssh/sshd_config.d/01-disable-usepam.conf; \
    else sed -i "s/UsePAM yes/UsePAM no/" /etc/ssh/sshd_config; fi

CMD [ "/usr/sbin/sshd", "-D" ]

EXPOSE 22
