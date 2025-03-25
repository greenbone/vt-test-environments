# Don't use anything RHEL 9-based. It'll break the RPM GPG key.
FROM docker.io/library/rockylinux:8.6 as builder

ARG TAG
WORKDIR /tmp

# Prepare environment
RUN mkdir -p rootfs/etc/yum.repos.d/
COPY EulerOS-base.repo rootfs/etc/yum.repos.d/

# Install packages (note the GPG key for EulerOS 2.0 seems to be broken, hence disabling it
# and we pin the releasever here, because it interferes with the yum installation)
RUN yum --installroot=/tmp/rootfs install --releasever $TAG \
    -y $([ "$TAG" = "2.0" ] && echo "--nogpgcheck") \
    openssh-server rootfiles yum

# Remove sometimes newly installed, but broken repofile
RUN rm rootfs/etc/yum.repos.d/EulerOS-base.repo.rpmnew || true
# Cleanup
RUN yum --installroot=/tmp/rootfs clean all \
    && rm -rf /var/cache/yum
# Removing other languages saves us ~100 MB
RUN localedef --prefix rootfs/ --delete-from-archive $(localedef --list-archive --prefix rootfs | grep -va "en_US.utf8") \
    && mv rootfs/usr/lib/locale/locale-archive rootfs/usr/lib/locale/locale-archive.tmpl \
    && chroot rootfs/ build-locale-archive

FROM scratch
ARG TAG
COPY --from=builder /tmp/rootfs/ /

# Pin releasever
RUN echo "${TAG}" > /etc/yum/vars/releasever \
    # Add demo user
    && useradd demo \
    && echo "demo:demo" | chpasswd \
    # Generate SSH keys
    && ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N "" \
    && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N "" \
    && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N "" \
    # Workaround to fix SSH login (see VTA-641)
    && sed -i "s/UsePAM yes/UsePAM no/" /etc/ssh/sshd_config

CMD [ "/usr/sbin/sshd", "-D" ]

EXPOSE 22
