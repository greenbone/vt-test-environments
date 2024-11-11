ARG BASEIMAGE=vulhub/weblogic
ARG TAG=10.3.6.0-2017

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
    && apt-get install --no-install-recommends -y openssh-server \
    && rm -rf /var/lib/apt/lists/* \
    && useradd demo \
    && echo "demo:demo" | chpasswd \
    && mkdir -p /var/run/sshd/

COPY init.sh /bin/init.sh

CMD [ "/bin/init.sh" ]

EXPOSE 22
EXPOSE 7001
