FROM alpine:3.6

RUN apk --no-cache update &&\
    apk --no-cache add \
      libressl \
      certbot &&\
    rm -rf /var/cache/apk/ &&\
    adduser -D -u 1000 ca

COPY bin/* /usr/local/bin/

VOLUME /tmp
WORKDIR /tmp

USER ca
