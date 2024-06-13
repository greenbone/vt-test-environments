
# vt-test-environments/applications/generic

This image contains generic services to test OS detection VTs. It's based on our Debian-based test images.

## Services installed

- `openssh-server` (port 22, inherited from the base image)
- `apache2` (port 80)
- `php`
- `mariadb-server` (port 3306)
- `samba` (port 445)

## Build

The Dockerfile requires two build arguments:
- `BASEIMAGE`: The name of the base image to build upon
- `TAG`: The tag of the base image to build upon

For example, to build the generic test image for Debian trixie (`ghcr.io/greenbone/vt-test-environments/debian:trixie`) and save under `generic:debian_trixie` run:

```
docker build --pull --build-arg BASEIMAGE=debian --build-arg TAG=trixie applications/generic -t generic:debian_trixie
```

You can use any Debian-based base image from [vt-test-environments](https://github.com/orgs/greenbone/packages?repo_name=vt-test-environments).


## Usage
For the example above, run:

```
docker run --rm -it -p 2222:22 -p 80:80 -p 445:445 -p 3306:3306 generic:debian_trixie
```

Note: In this example, I mapped all container ports to the host, except for port 22, which is mapped to port 2222 on the host.
