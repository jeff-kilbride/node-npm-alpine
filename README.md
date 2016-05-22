# Node / NPM Docker Image on Alpine

[![](https://imagelayers.io/badge/jkilbride/node-npm-alpine:latest.svg)](https://imagelayers.io/?images=jkilbride/node-npm-alpine:latest 'Get your own badge on imagelayers.io')

This is a simple Node.js and NPM installation running on Alpine Linux. It utilizes the official alpine:edge release and installs the nodejs package via apk, the Alpine Linux package manager. It also removes some unnecessary files / directories in an attempt to keep the image as small as possible.

This image is a base image, created to enhance my own workflow. You are more than welcome to use it, if you are interested.

To use this image in your own Dockerfiles, add it to your FROM statement:

    FROM jkilbride/node-npm-alpine

---
As an update, I have also now added a simple `.profile` to the `/root` directory for times when I need to login to the container and look around. (I was getting tired of typing `alias ll="ls -lFa"` every time I needed to login...) To use it, type `. /root/.profile` at the command prompt. Be aware that I prefer `vi` keybindings. If you prefer the default `emacs` keybindings, simply type `set -o emacs` at the prompt.


## Maintainer

* [Jeff Kilbride](https://github.com/jeff-kilbride) jeff@kilbride.com

## Caveats

As Alpine Linux uses musl, you may run into some issues with environments expecting glibc-like behaviour (for example, Kubernetes). Some of these issues are documented here:

* http://gliderlabs.viewdocs.io/docker-alpine/caveats/
* https://github.com/gliderlabs/docker-alpine/issues/8

## Inspired by

* https://github.com/mhart/alpine-node
* https://github.com/ZZROTDesign/alpine-node

## License

The code is available under the [MIT License](/LICENSE).