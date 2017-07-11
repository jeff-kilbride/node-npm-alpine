# Node / NPM Docker Image on Alpine

[![](https://images.microbadger.com/badges/image/jkilbride/node-npm-alpine.svg)](http://microbadger.com/images/jkilbride/node-npm-alpine "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/jkilbride/node-npm-alpine.svg)](http://microbadger.com/images/jkilbride/node-npm-alpine "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/license/jkilbride/node-npm-alpine.svg)](http://microbadger.com/images/jkilbride/node-npm-alpine "Get your own license badge on microbadger.com")

**UPGRADE NOTICE:** I am upgrading all containers to Alpine 3.6 and adding Yarn to the mix, starting with v8.0.0. The rest will be upgraded with their next releases.

This is a simple Node.js and NPM installation running on Alpine Linux. The following are the current tags I am creating. **NOTE:** the size in the badge from MicroBadger.com above is WRONG. Correct file sizes are listed below. However, you can still click on that link to see the correct layers.

- [latest, 8, 8.1, 8.1.4](https://github.com/jeff-kilbride/node-npm-alpine/blob/8/Dockerfile) (61.3 MB)
- [6, 6.11, 6.11.0](https://github.com/jeff-kilbride/node-npm-alpine/blob/6/Dockerfile) (49.9 MB)
- [4, 4.8, 4.8.3](https://github.com/jeff-kilbride/node-npm-alpine/blob/4/Dockerfile) (32.5 MB)

I will bump these as Node versions change, but the older versions should remain in this repository. These images are base images, created to enhance my own workflow. You are more than welcome to use them, if you are interested.

The Node/NPM versions in the various tags are:

```
$ docker run --rm jkilbride/node-npm-alpine:8 node --version
v8.1.4

$ docker run --rm jkilbride/node-npm-alpine:8 npm --version
5.2.0

$ docker run --rm jkilbride/node-npm-alpine:8 yarn --version
0.27.5

$ docker run --rm jkilbride/node-npm-alpine:6 node --version
v6.11.0

$ docker run --rm jkilbride/node-npm-alpine:6 npm --version
3.10.10

$ docker run --rm jkilbride/node-npm-alpine:6 yarn --version
0.24.6

$ docker run --rm jkilbride/node-npm-alpine:4 node --version
v4.8.3

$ docker run --rm jkilbride/node-npm-alpine:4 npm --version
2.15.11
```
---

To use an image in your own Dockerfiles, add it to your FROM statement:

```
FROM jkilbride/node-npm-alpine

FROM jkilbride/node-npm-alpine:8

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
