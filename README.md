![Greenbone Logo](https://www.greenbone.net/wp-content/uploads/gb_new-logo_horizontal_rgb_small.png)

# vt-test-environments
This repository holds environments for VT testing. _Do not_ use them in production!

Each image comes with a pre-installed SSH server and a demo account (both name and password are "demo"). This unified behavior of different operating systems and applications enables a VT developer to deploy a clean test environment within seconds.

For questions regarding this repository, please consult the [Greenbone Community Forum](https://forum.greenbone.net/).

## Usage
Run `docker run --rm -d -p 2222:22 --name target ghcr.io/greenbone/vt-test-environments/mageia_linux:8`. The container is then running and SSH is exposed on port 2222 on your local machine and is ready to be scanned:
```
# ssh demo@localhost -p 2222
Password: 
[demo@fff64423955b ~]$ cat /etc/os-release 
NAME="Mageia"
VERSION="8"
[...]
```
However, please use `docker exec -it target bash` preferrebly to interact with the container, because SSH might not be possible e.g. for very old images with no matching key exchange algorithm or requires removing the fingerprint of previously used containers from your known hosts file.

When you're done, you can stop using `docker stop target`.
## Available images & tags
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
- EulerOS Linux (`euleros_linux`)
    - `2.0`
    - `2.1`
    - `2.2`
    - `2.3`
    - `2.5`
    - `2.9`
    - `2.10`
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
    - `15.0`
    - `current` (15.0+ at the moment)
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

## Build
To build e.g. the image for Mageia 8 use:
```
docker build operating_systems/mageia_linux --build-arg=TAG=8 -t mageia_linux:8
```

If not specified otherwise, the image will be built with its packages explicitly updated. This is available for most images. To build the image for Oracle Linux 5 (non-updated) use:
```
docker build operating_systems/oracle_linux --build-arg=TAG=5 --build-arg=UPDATED=false -t oracle_linux:5
```
