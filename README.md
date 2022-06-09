# vt-test-environments
Environments for VT testing

Each Docker image comes with a pre-installed SSH server and a demo user (password: demo). This enables a VT developer to deploy a clean test environment within seconds.

# Available images & tags
- Alma Linux (`alma_linux`)
    - `8.5`
    - `8.6`
    - `9.0`
- Amazon Linux (`amazon_linux`)
    - `1`
    - `2`
    - `2022`
- Debian Linux (`debian_linux`)
    - `woody`
    - `sarge`
    - `etch`
    - `lenny`
    - `squeeze`
    - `wheezy`
    - `jessie`
    - `stretch`
    - `buster`
    - `bullseye`
- Mageia Linux (`mageia_linux`)
    - `7`
    - `8`
- Oracle Linux (`oracle_linux`)
    - `5`
    - `6`
    - `7`
    - `8`
- Rocky Linux (`rocky_linux`)
    - `8.5`
- Slackware Linux (`slackware_linux`)
    - `13.0`
    - `13.37`
    - `14.0`
    - `14.1`
    - `14.2`
    - `current` (15.0 at the moment)

## Build images
To build e.g. the image for Mageia 8 use:
```
docker build -t mageia_linux:8 -f mageia_linux.dockerfile --build-arg BASEIMAGE=mageia --build-arg TAG=8 .
```
To build e.g. the image for Oracle Linux 5 (non-updated) use:
```
docker build -t oracle_linux:5 -f oracle_linux.dockerfile --build-arg BASEIMAGE=container-registry.oracle.com/os/oraclelinux --build-arg TAG=5 --build-arg UPDATED=false .
```

## Run container
Run `docker run --rm -d -p 2222:22 --name target ghcr.io/greenbone/vt-test-environments/mageia_linux:8`. The container is then running and SSH is exposed on port 2222 on your local machine:
```
# ssh demo@localhost -p 2222
Password: 
[demo@fff64423955b ~]$ cat /etc/os-release 
NAME="Mageia"
VERSION="8"
[...]
```

When you're done, you can stop (and destroy, when run with `--rm`) using `docker stop target`.