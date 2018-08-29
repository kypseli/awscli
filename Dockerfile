FROM alpine:3.7
MAINTAINER kmadel@cloudbees.com

ARG CLI_VERSION=1.16.3
ENV CLI_VERSION=${CLI_VERSION}

RUN apk --no-cache --update add bash curl less groff jq python py-pip && \
  pip install --no-cache-dir --upgrade pip && \
  pip install --no-cache-dir awscli==$CLI_VERSION
