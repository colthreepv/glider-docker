FROM alpine:latest

RUN apk add --no-cache --update-cache --update git go musl-dev && \
    apk del git && \
    rm -rf /tmp/* /var/cache/apk/* && \
    go get -u github.com/nadoo/glider

ENTRYPOINT ["glider"]
CMD ["-listen",":8443","-verbose"]
