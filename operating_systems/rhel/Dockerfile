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
    && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ""

CMD [ "/usr/sbin/sshd", "-D" ]

EXPOSE 22
