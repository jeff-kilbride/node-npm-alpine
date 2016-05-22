FROM alpine:edge

MAINTAINER Jeff Kilbride <jeff@kilbride.com>

ENV NPM_VERSION=3

# Install node.js and npm. Upgrade npm and remove fluff.
# Also, add a basic .profile to the /root directory, for times
# when we need to login to the container and look around.
WORKDIR /root
COPY .profile .
RUN apk add --no-cache nodejs && \
  if [ -x /usr/bin/npm ]; then \
    npm install -g npm@${NPM_VERSION} && \
    find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf; \
  fi && \
  rm -rf /tmp/* /root/.npm /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc \
    /usr/lib/node_modules/npm/html
