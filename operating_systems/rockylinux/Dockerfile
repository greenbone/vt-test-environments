ARG BASEIMAGE=docker.io/rockylinux/rockylinux
ARG TAG

FROM ${BASEIMAGE}:${TAG}
ARG UPDATED=false
ARG TAG

# Lock releasever to the tag to pin the minor release
RUN echo "${TAG}" > /etc/yum/vars/releasever \
    # Older release are not in pub/, but in vault/
    && echo "vault/rocky" > /etc/yum/vars/contentdir \
    # Uncomment the baseurl, because the mirrorlist doesn't support older releases
    && sed -i "s/#baseurl=/baseurl=/" /etc/yum.repos.d/* \
    # Add "rocky-" prefix to repo to select minor release in mirrorlist (fallback for baseurl)
    && sed -i "s/repo=/repo=rocky-/" /etc/yum.repos.d/* \
    && if [ "$UPDATED" = true ]; then dnf upgrade -y; fi \
    && dnf install -y openssh-server \
    && dnf clean all \
    && useradd demo \
    && echo "demo:demo" | chpasswd \
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" \
    && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" \
    && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" \
    # Enable login, otherwise blocked by pam_nologin (needed for 9.0 or lower)
    && rm /var/run/nologin || true

CMD [ "/usr/sbin/sshd", "-D" ]

EXPOSE 22
