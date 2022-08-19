ARG BASEIMAGE
ARG TAG

FROM ${BASEIMAGE}:${TAG}
ARG UPDATED=true

ENV DEBIAN_FRONTEND=noninteractive
RUN ( \
    apt-get update \
    || \
    # If update fails, the release is likely EOL, so use the old-releases repo instead
    if [ $? = 100 ]; then sed -i "s/security\|archive/old-releases/" /etc/apt/sources.list && apt-get update; fi \
    ) \
    && if [ "$UPDATED" = true ]; then apt-get upgrade -y; fi \
    && apt-get install -y openssh-server \
    && rm -rf /var/lib/apt/lists/* \
    && useradd demo \
    && echo "demo:demo" | chpasswd \
    && mkdir -p /var/run/sshd/

CMD [ "/usr/sbin/sshd", "-D" ]

EXPOSE 22