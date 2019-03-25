FROM node:11.12.0-alpine

ENV NPM_CONFIG_LOGLEVEL error

# Install AWS CLI
RUN apk --no-cache update && \
    apk --no-cache add python py-pip py-setuptools ca-certificates groff less && \
    pip --no-cache-dir install awscli

# Install development packages
RUN apk add --no-cache --update bash curl git openssh tzdata
RUN apk update && apk upgrade && rm -rf /var/cache/apk/*

RUN yarn config set ignore-engines true
