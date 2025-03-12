ARG BASEIMAGE=docker.io/homeassistant/home-assistant
ARG TAG

FROM ${BASEIMAGE}:${TAG}

COPY build.sh /tmp/build.sh
RUN chmod +x /tmp/build.sh && /tmp/build.sh && rm /tmp/build.sh

COPY init.sh /bin/init.sh

CMD [ "/bin/init.sh" ]

EXPOSE 22
EXPOSE 8123
