FROM alpine:3.5

RUN apk --no-cache update &&\
    apk --no-cache add \
      libressl &&\
    rm -rf /var/cache/apk/ &&\
    adduser -D -u 1000 ca

COPY bin/* /usr/bin/

VOLUME /tmp
WORKDIR /tmp
USER ca
