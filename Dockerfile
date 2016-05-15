FROM alpine:edge

MAINTAINER Jeff Kilbride <jeff@kilbride.com>

ENV NPM_VERSION=3

# Install node.js and npm. Upgrade npm and remove fluff.
# As of 2016-05-15, this will install:
#   libstdc++-5.3.0-r0
#   libgcc-5.3.0-r0
#   nodejs-5.11.0-r0 (with npm 3.9.0)
RUN apk add --no-cache nodejs && \
  npm install -g npm@${NPM_VERSION} && \
  find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf; && \
  rm -rf /tmp/* /root/.npm /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc \
    /usr/lib/node_modules/npm/html