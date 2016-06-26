# Node / NPM Docker Image on Alpine

This is a simple Node.js and NPM installation running on Alpine Linux. I used to install Node using `apk`, the Alpine Linux package manager. However, the move to Node 6.2.0 in Alpine 3.4 brought breaking changes to my code. Unfortunately, previously available packages are not officially available through `apk`, so I have started compiling my own versions in order to have older versions of Node on Alpine  3.4.

The following are the current tags I am creating:

* latest, 6, 6.2, 6.2.2
* 5, 5.12, 5.12.0
* 4, 4.4, 4.4.6

I will bump these as Node versions change, but the older versions should remain in this repository. These images are base images, created to enhance my own workflow. You are more than welcome to use them, if you are interested.

To use an image in your own Dockerfiles, add it to your FROM statement:

    FROM jkilbride/node-npm-alpine

    FROM jkilbride/node-npm-alpine:6

    FROM jkilbride/node-npm-alpine:5

    FROM jkilbride/node-npm-alpine:4

    etc...

---
I routinely login to my running containers to poke around. For convenience, I have added some shell aliases to `/etc/profile.d/aliases.sh` and enabled the `/etc/profile.d/color_prompt.sh` file. If you would like to have these customizations available when you login to a container, you must specify a login shell on the `docker` command line:

    $ docker exec -it [your-container-name] /bin/sh -l

You can also enable the customizations from inside the container at any time by sourcing the `/etc/profile` file:

    # . /etc/profile

Be aware that I prefer `vi` keybindings. If you prefer the default `emacs` keybindings, type `set -o emacs` at the command prompt.


## Maintainer

* [Jeff Kilbride](https://github.com/jeff-kilbride) jeff@kilbride.com

## Inspired by

* https://github.com/mhart/alpine-node
* https://github.com/ZZROTDesign/alpine-node

## License

The code is available under the [MIT License](/LICENSE).