ARG BASEIMAGE=docker.io/library/archlinux
ARG TAG

FROM ${BASEIMAGE}:${TAG}

ARG UPDATED=false

RUN if [ "$UPDATED" = "true" ]; then pacman -Syu --noconfirm; fi \
    && pacman -Sy --noconfirm openssh \
    && useradd demo \
    && echo "demo:demo" | chpasswd \
    && ssh-keygen -A \
    && pacman -Scc --noconfirm

CMD ["/usr/bin/sshd", "-D"]

EXPOSE 22
