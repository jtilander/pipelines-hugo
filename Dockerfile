FROM alpine:3.12.0
MAINTAINER Jim Tilander
ENV HUGO_VERSION=0.74.3

RUN apk add --no-cache --virtual .gethugo curl && \
        cd /tmp/ && \
        curl -SsL -O https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
        tar xvzf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
        rm -r hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
        ls -alh /tmp && \
        mv hugo /usr/bin/hugo && \
        rm * && \
        apk del .gethugo

RUN apk add --no-cache make rsync openssh