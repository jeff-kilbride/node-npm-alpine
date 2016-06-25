# Node / NPM Docker Image on Alpine

[![](https://imagelayers.io/badge/jkilbride/node-npm-alpine:latest.svg)](https://imagelayers.io/?images=jkilbride/node-npm-alpine:latest 'Get your own badge on imagelayers.io')

This is a simple Node.js and NPM installation running on Alpine Linux. It utilizes the official alpine:3.4 release and installs the nodejs package via apk, the Alpine Linux package manager. It also removes some unnecessary files / directories in an attempt to keep the image as small as possible.

This image is a base image, created to enhance my own workflow. You are more than welcome to use it, if you are interested.

To use this image in your own Dockerfiles, add it to your FROM statement:

    FROM jkilbride/node-npm-alpine

---
I have customized the shell by adding `aliases.sh` to the `/etc/profile.d` directory and enabling the `color_prompt.sh` file. Be aware that I prefer `vi` keybindings. If you prefer the default `emacs` keybindings, type `set -o emacs` at the command prompt.


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