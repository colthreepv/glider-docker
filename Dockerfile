FROM alpine:latest

RUN apk add --no-cache --update-cache --update git go musl-dev && \
    go get -u github.com/nadoo/glider && \
    apk del git go musl-dev && \
    rm -rf /tmp/* /var/cache/apk/* && \
    mkdir -p /glider-conf

EXPOSE 8443 53
VOLUME /glider-conf
ENTRYPOINT ["/root/go/bin/glider"]
CMD ["-listen",":8443","-verbose"]
