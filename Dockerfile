FROM alpine:3.8
MAINTAINER kmadel@cloudbees.com

ARG CLI_VERSION=1.16.3
ENV CLI_VERSION=${CLI_VERSION}

RUN apk --no-cache --update add bash curl less groff jq python py-pip && \
 pip install --no-cache-dir --upgrade pip && \
 pip install --no-cache-dir awscli==$CLI_VERSION


ARG user=jenkins
ARG group=jenkins
ARG uid=10000
ARG gid=10000

ENV HOME /home/${user}
RUN addgroup -g ${gid} ${group}
RUN adduser -h $HOME -u ${uid} -G ${group} -D ${user}

USER ${user}
RUN mkdir /home/${user}/.aws

VOLUME /home/${user}/.aws
WORKDIR /home/${user}
