FROM alpine:3.6

RUN apk --no-cache update &&\
    apk --no-cache add \
      libressl \
      certbot &&\
    rm -rf /var/cache/apk/ &&\
    adduser -D -u 1000 ca

COPY bin/* /usr/bin/

VOLUME /tmp
WORKDIR /tmp

# TODO Find a wait for bin/signed to bind port 443 without root
USER ca
