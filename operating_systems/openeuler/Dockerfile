ARG BASEIMAGE=docker.io/openeuler/openeuler
ARG TAG

FROM ${BASEIMAGE}:${TAG}
ARG UPDATED=false
ARG TAG

RUN if [ "$TAG" = "20.03-lts" ]; then dnf install -y \
    https://repo.openeuler.org/openEuler-20.03-LTS/update/x86_64/Packages/openEuler-gpg-keys-1.0-2.9.oe1.x86_64.rpm \
    https://repo.openeuler.org/openEuler-20.03-LTS/update/x86_64/Packages/openEuler-repos-1.0-2.9.oe1.x86_64.rpm; fi
RUN if [ "$UPDATED" = true ]; then dnf upgrade -y; fi \
    && dnf install -y openssh-server passwd shadow-utils\
    && dnf clean all \
    && useradd demo \
    && echo "demo" | passwd --stdin demo \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" \
    && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" \
    && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ""

CMD [ "/usr/sbin/sshd", "-D" ]

EXPOSE 22
