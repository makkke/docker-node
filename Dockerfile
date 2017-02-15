FROM node:7-alpine

ENV NPM_CONFIG_LOGLEVEL error
ENV YARN_VERSION 0.21.0

# Install Yarn
ADD https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v${YARN_VERSION}.tar.gz /opt/yarn.tar.gz
RUN cd /opt/ && \
    tar xf yarn.tar.gz && \
    mv dist yarn && \
    rm yarn.tar.gz
ENV PATH $PATH:/opt/yarn/bin/

# Install AWS CLI
RUN apk --no-cache update && \
    apk --no-cache add python py-pip py-setuptools ca-certificates groff less && \
    pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/*
