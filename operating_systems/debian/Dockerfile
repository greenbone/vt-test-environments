ARG BASEIMAGE=debian
ARG TAG

FROM ${BASEIMAGE}:${TAG}
ARG UPDATED=false

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && if [ "$UPDATED" = true ]; then apt-get upgrade -y; fi \
    && if [ $(cut -d "." -f 1 /etc/debian_version) -lt 4 ]; then apt-get install -y ssh; \
    elif [ $(cut -d "." -f 1 /etc/debian_version) -eq 4 ]; then apt-get install -y openssh-server; \
    else apt-get install --no-install-recommends -y openssh-server; fi \
    && rm -rf /var/lib/apt/lists/* \
    && useradd demo \
    && echo "demo:demo" | chpasswd \
    && mkdir -p /var/run/sshd/

CMD [ "/usr/sbin/sshd", "-D" ]

EXPOSE 22
