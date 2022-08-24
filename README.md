# vt-test-environments
Environments for VT testing

Each Docker image comes with a pre-installed SSH server and a demo user (password: demo). This enables a VT developer to deploy a clean test environment within seconds.

# Available images & tags
- [Alma Linux](https://hub.docker.com/_/almalinux/tags) (`alma_linux`)
    - `8.5`
    - `8.6`
    - `9.0`
- [Amazon Linux](https://hub.docker.com/_/amazonlinux/tags) (`amazon_linux`)
    - `1`
    - `2`
    - `2022`
- [Debian Linux](https://hub.docker.com/_/debian/tags) (`debian_linux`)
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
- [Mageia Linux](https://hub.docker.com/_/mageia/tags) (`mageia_linux`)
    - `7`
    - `8`
- [Oracle Linux](https://hub.docker.com/_/oraclelinux/tags) (`oracle_linux`)
    - `5`
    - `6`
    - `7`
    - `8`
    - `9`
- [Rocky Linux](https://hub.docker.com/_/rockylinux/tags) (`rocky_linux`)
    - `8.5`
    - `8.6`
    - `9.0`
- [Slackware Linux](https://hub.docker.com/r/vbatts/slackware/tags) (`slackware_linux`)
    - `13.0`
    - `13.37`
    - `14.0`
    - `14.1`
    - `14.2`
    - `current` (15.0 at the moment)
- [Ubuntu Linux](https://hub.docker.com/_/ubuntu/tags) (`ubuntu_linux`)
    - `10.04` (LTS, Lucid Lynx)
    - `12.04` (LTS, Precise Pangolin)
    - `12.10` (Quantal Quetzal)
    - `13.04` (Raring Ringtail)
    - `13.10` (Saucy Salamander)
    - `14.04` (LTS, Trusty Tahr)
    - `14.10` (Utopic Unicorn)
    - `15.04` (Vivid Vervet)
    - `15.10` (Wily Werewolf)
    - `16.04` (LTS, Xenial Xerus)
    - `16.10` (Yakkety Yak)
    - `17.04` (Zesty Zapus)
    - `17.10` (Artful Aardvark)
    - `18.04` (LTS, Bionic Beaver)
    - `18.10` (Cosmic Cuttlefish)
    - `19.04` (Disco Dingo)
    - `19.10` (Eoan Ermine)
    - `20.04` (LTS, Focal Fossa)
    - `20.10` (Groovy Gorilla)
    - `21.04` (Hirsute Hippo)
    - `21.10` (Impish Indri)
    - `22.04` (LTS, Jammy Jellyfish)
    - `22.10` (Kinetic Kudu)

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