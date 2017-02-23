FROM alpine:3.4

MAINTAINER Jeff Kilbride <jeff@kilbride.com>

#ENV NODE_VERSION=v4.8.0 NPM_VERSION=2
#ENV NODE_VERSION=v6.10.0 NPM_VERSION=3
ENV NODE_VERSION=v7.6.0 NPM_VERSION=4

RUN apk upgrade --update \
    && apk add --no-cache \
        libstdc++ \
    && apk add --no-cache --virtual .build-deps \
        binutils-gold \
        curl \
        g++ \
        gcc \
        gnupg \
        libgcc \
        linux-headers \
        make \
        python \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys \
      9554F04D7259F04124DE6B476D5A82AC7E37093B \
      94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
      0034A06D9D9B0064CE8ADF6BF1747F4AD2306D93 \
      FD3A5288F042B6850C66B31F09FE44734EB7990E \
      71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
      DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
      B9AE9905FFD7803F25714661B63B535A4C206CA9 \
      C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
      56730D5401028683275BD23C23EFEFE93C4CFFFE \
    && mkdir -p /usr/local/src \
    && cd /usr/local/src \
    && curl -SLO "https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}.tar.xz" \
    && curl -SLO "https://nodejs.org/dist/${NODE_VERSION}/SHASUMS256.txt.asc" \
    && gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc \
    && grep " node-${NODE_VERSION}.tar.xz\$" SHASUMS256.txt | sha256sum -c - \
    && tar -xf "node-${NODE_VERSION}.tar.xz" \
    && cd "node-${NODE_VERSION}" \
    && ./configure --prefix=/usr \
    && make -j$(getconf _NPROCESSORS_ONLN) \
    && make install \
    && cd /root \
    && if [ -x /usr/bin/npm ]; then \
         npm install -g npm@${NPM_VERSION} && \
         find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf; \
       fi \
    && apk del .build-deps \
    && rm -rf /usr/local/src /tmp/* /usr/share/man /var/cache/apk/* \
      /root/.npm /root/.node-gyp /root/.gnupg /usr/lib/node_modules/npm/man \
      /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html /etc/ssl \
      /usr/include/node \
    && mv -f /etc/profile.d/color_prompt /etc/profile.d/color_prompt.sh

COPY aliases.sh /etc/profile.d/

LABEL org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.license="MIT" \
      org.label-schema.name="Node / NPM Alpine" \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/jeff-kilbride/node-npm-alpine"