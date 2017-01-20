FROM node:7-alpine

ENV NPM_CONFIG_LOGLEVEL info

# Install packages
RUN apk add --no-cache --update \
    bash curl git openssh && \
    rm -rf /var/cache/apk/*

# Install Yarn
RUN mkdir -p /opt
ADD yarn-v0.19.1.tar.gz /opt/
RUN mv /opt/dist /opt/yarn
ENV PATH "$PATH:/opt/yarn/bin"
