# Node / NPM Docker Image on Alpine

[![](https://images.microbadger.com/badges/image/jkilbride/node-npm-alpine.svg)](http://microbadger.com/images/jkilbride/node-npm-alpine "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/jkilbride/node-npm-alpine.svg)](http://microbadger.com/images/jkilbride/node-npm-alpine "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/license/jkilbride/node-npm-alpine.svg)](http://microbadger.com/images/jkilbride/node-npm-alpine "Get your own license badge on microbadger.com")

**Deprecation notice and end of support.**

_The current container versions -- 9.1.0, 8.9.1, 6.12.0, 4.8.6 -- will be the last versions I produce and publish to Docker Hub. When I started creating these containers, the official Node Docker releases were not available on Alpine Linux. I took it upon myself to create these containers to support my own development workflow and to help myself learn more about Docker. I was hoping others might also find them useful. Since that time, the Node Docker team has begun publishing official Alpine Linux containers of their own. I now feel that these containers are no longer necessary and I have begun to move my own development environment over to using the official releases. I encourage anyone using these containers to also check out the official Node Alpine versions. If anyone would like to continue publishing these containers, you are more than welcome to fork my Github repo and pick up where I leave off!_

---

This is a simple Node.js and NPM installation running on Alpine Linux. The following are the current tags I am creating. **NOTE:** the size in the badge from MicroBadger.com above is WRONG. Correct file sizes are listed below. However, you can still click on that link to see the correct layers.

- [latest, 9, 9.1, 9.1.0](https://github.com/jeff-kilbride/node-npm-alpine/blob/8/Dockerfile) (63.5 MB)
- [8, 8.9, 8.9.1](https://github.com/jeff-kilbride/node-npm-alpine/blob/8/Dockerfile) (63.8 MB)
- [6, 6.12, 6.12.0](https://github.com/jeff-kilbride/node-npm-alpine/blob/6/Dockerfile) (50.1 MB)
- [4, 4.8, 4.8.6](https://github.com/jeff-kilbride/node-npm-alpine/blob/4/Dockerfile) (35.9 MB)

I will bump these as Node versions change, but the older versions should remain in this repository. These images are base images, created to enhance my own workflow. You are more than welcome to use them, if you are interested.

The Node/NPM versions in the various tags are:

```
$ docker run --rm jkilbride/node-npm-alpine:9 node --version
v9.1.0

$ docker run --rm jkilbride/node-npm-alpine:9 npm --version
5.5.1

$ docker run --rm jkilbride/node-npm-alpine:9 yarn --version
1.3.2

$ docker run --rm jkilbride/node-npm-alpine:8 node --version
v8.9.1

$ docker run --rm jkilbride/node-npm-alpine:8 npm --version
5.5.1

$ docker run --rm jkilbride/node-npm-alpine:8 yarn --version
1.3.2

$ docker run --rm jkilbride/node-npm-alpine:6 node --version
v6.12.0

$ docker run --rm jkilbride/node-npm-alpine:6 npm --version
3.10.10

$ docker run --rm jkilbride/node-npm-alpine:6 yarn --version
1.3.2

$ docker run --rm jkilbride/node-npm-alpine:4 node --version
v4.8.6

$ docker run --rm jkilbride/node-npm-alpine:4 npm --version
2.15.12

$ docker run --rm jkilbride/node-npm-alpine:4 yarn --version
1.3.2
```
---

To use an image in your own Dockerfiles, add it to your FROM statement:

```
FROM jkilbride/node-npm-alpine

FROM jkilbride/node-npm-alpine:9

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
