# Node / NPM Docker Image on Alpine

[![](https://images.microbadger.com/badges/image/jkilbride/node-npm-alpine.svg)](http://microbadger.com/images/jkilbride/node-npm-alpine "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/jkilbride/node-npm-alpine.svg)](http://microbadger.com/images/jkilbride/node-npm-alpine "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/license/jkilbride/node-npm-alpine.svg)](http://microbadger.com/images/jkilbride/node-npm-alpine "Get your own license badge on microbadger.com")

This is a simple Node.js and NPM installation running on Alpine Linux. The following are the current tags I am creating. **NOTE:** the size in the badge from MicroBadger.com above is WRONG. Correct file sizes are listed below. However, you can still click on that link to see the correct layers.

- [latest, 7, 7.2, 7.2.0](https://github.com/jeff-kilbride/node-npm-alpine/blob/7/Dockerfile) (51.96MB)
- [6, 6.9, 6.9.1](https://github.com/jeff-kilbride/node-npm-alpine/blob/6/Dockerfile) (49.73MB)
- [4, 4.6, 4.6.2](https://github.com/jeff-kilbride/node-npm-alpine/blob/4/Dockerfile) (37.62MB)

I will bump these as Node versions change, but the older versions should remain in this repository. These images are base images, created to enhance my own workflow. You are more than welcome to use them, if you are interested.

The Node/NPM versions in the various tags are:

```
$ docker run jkilbride/node-npm-alpine:7 node --version
v7.2.0

$ docker run jkilbride/node-npm-alpine:7 npm --version
4.0.2

$ docker run jkilbride/node-npm-alpine:6 node --version
v6.9.1

$ docker run jkilbride/node-npm-alpine:6 npm --version
3.10.8

$ docker run jkilbride/node-npm-alpine:4 node --version
v4.6.2

$ docker run jkilbride/node-npm-alpine:4 npm --version
2.15.11
```
---

To use an image in your own Dockerfiles, add it to your FROM statement:

```
FROM jkilbride/node-npm-alpine

FROM jkilbride/node-npm-alpine:7

FROM jkilbride/node-npm-alpine:6

FROM jkilbride/node-npm-alpine:4

etc...
```

---

I routinely login to my running containers to poke around. For convenience, I have added some shell aliases to `/etc/profile.d/aliases.sh` and enabled the `/etc/profile.d/color_prompt.sh` file. If you would like to have these customizations available when you login to a container, you must specify a login shell on the `docker` command line:

```
$ docker exec -it [your-container-name] /bin/sh -l
```

You can also enable the customizations from inside the container at any time by sourcing the `/etc/profile` file:

```
# . /etc/profile
```

Be aware that I prefer `vi` keybindings. If you prefer the default `emacs` keybindings, type `set -o emacs` at the command prompt.

## Maintainer

- [Jeff Kilbride](https://github.com/jeff-kilbride) jeff@kilbride.com

## Inspired by

- <https://github.com/mhart/alpine-node>

## License

The code is available under the [MIT License](/LICENSE).
