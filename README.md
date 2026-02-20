![Greenbone Logo](https://www.greenbone.net/wp-content/uploads/gb_new-logo_horizontal_rgb_small.png)

# vt-test-environments

This repository holds environments for VT testing. Do _not_ use them in production!

Each image comes with a pre-installed SSH server and a demo account (both name and password are "demo"). This unified behavior of different operating systems and applications enables a VT developer to deploy a clean test environment within seconds.

For questions regarding this repository, please consult the [Greenbone Community Forum](https://forum.greenbone.net/).

## General usage

Run `docker run --rm -d -p 2222:22 --name target ghcr.io/greenbone/vt-test-environments/mageia:8`. The container is then running, SSH is exposed on port 2222 on the local machine and is ready to be scanned:

```
# ssh demo@localhost -p 2222
Password: 
[demo@fff64423955b ~]$ cat /etc/os-release 
NAME="Mageia"
VERSION="8"
[...]
```

However, please use `docker exec -it target bash` preferrebly to interact with the container, because SSH might not be possible e.g. for very old images with no matching key exchange algorithm or requires removing the fingerprint of previously used containers from your known hosts file.

When done, the container can be stopped with `docker stop target`.

## Available images & tags

### Applications

- Generic (needs to be built manually, see [applications/generic/README.md](applications/generic/README.md))
- [Home Assistant](https://ghcr.io/greenbone/vt-test-environments/home-assistant) (`home-assistant`, run with `--network host`, when requiring e.g. mDNS capabilities)
  - `0.84.6` (Seems to be based on Debian)
  - `2023.5.2` (And newer seems to be based on Alpine)
  - `2025.3`
- [Oracle WebLogic Server](https://ghcr.io/greenbone/vt-test-environments/oracle-weblogic) (`oracle-weblogic`)
  - `10.3.6.0-2017` (Image based on `Ubuntu 14.04.4 LTS`)
  - `12.2.1.3-2018` (Image based on `Oracle Linux Server 7.4`)
  - See [applications/oracle-weblogic/README.md](applications/oracle-weblogic/README.md) for more background info and usage

### Operating Systems

- [AlmaLinux](https://ghcr.io/greenbone/vt-test-environments/almalinux) (`almalinux`)
  - `8.4`
  - `8.5`
  - `8.6`
  - `8.7`
  - `9.0`
  - `9.1`
  - `9.2`
  - `9.3`
  - `9.4`
  - `10.0`
  - `10.1`
- [Amazon Linux](https://ghcr.io/greenbone/vt-test-environments/amazonlinux) (`amazonlinux`)
  - `1`
  - `2`
  - `2022`
  - `2023`
- [Arch Linux](https://ghcr.io/greenbone/vt-test-environments/archlinux) (`archlinux`)
  - `latest`
- [Debian](https://ghcr.io/greenbone/vt-test-environments/debian) (`debian`)
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
  - `bookworm`
  - `trixie`
- [EulerOS](https://ghcr.io/greenbone/vt-test-environments/euleros) (`euleros`)
  - `2.0`
  - `2.1`
  - `2.2`
  - `2.3`
  - `2.5`
  - `2.9`
  - `2.10`
- [Fedora](https://ghcr.io/greenbone/vt-test-environments/fedora) (`fedora`)
  - `39`
  - `40`
- [Mageia](https://ghcr.io/greenbone/vt-test-environments/mageia) (`mageia`)
  - `7`
  - `8`
  - `9`
- [openEuler](https://ghcr.io/greenbone/vt-test-environments/openeuler) (`openeuler`)
  - `20.03-lts`
  - `20.03-lts-sp1`
  - `20.03-lts-sp2`
  - `20.03-lts-sp3`
  - `20.03-lts-sp4`
  - `22.03-lts`
  - `22.03-lts-sp1`
  - `22.03-lts-sp2`
  - `22.03-lts-sp3`
  - `22.03-lts-sp4`
  - `23.03`
  - `23.09`
  - `24.03-lts`
  - `24.09`
- [openSUSE](https://ghcr.io/greenbone/vt-test-environments/opensuse) (`opensuse`)
  - `15.2`
  - `15.3`
  - `15.4`
  - `15.5`
  - `15.6`
  - `tumbleweed`
- [Oracle Linux](https://ghcr.io/greenbone/vt-test-environments/oraclelinux) (`oraclelinux`)
  - `5`
  - `6`
  - `7`
  - `8`
  - `9`
  - `10`
- [Red Hat Enterprise Linux](https://ghcr.io/greenbone/vt-test-environments/rhel) (`rhel`)
  - `7.6`
  - `7.7`
  - `7.8`
  - `7.9`
  - `8.0`
  - `8.1`
  - `8.2`
  - `8.3`
  - `8.4`
  - `8.5`
  - `8.6`
  - `8.7`
  - `9.0.0`
  - `9.1.0`
  - `10.0`
  - `10.1`
- [Rocky Linux](https://ghcr.io/greenbone/vt-test-environments/rockylinux) (`rockylinux`)
  - `8.5`
  - `8.6`
  - `8.7`
  - `8.8`
  - `8.9`
  - `8.10`
  - `9.0`
  - `9.1`
  - `9.2`
  - `9.3`
  - `9.4`
  - `9.5`
  - `9.6`
  - `9.7`
  - `10.0`
  - `10.1`
- [Slackware](https://ghcr.io/greenbone/vt-test-environments/slackware) (`slackware`)
  - `13.0`
  - `13.37`
  - `14.0`
  - `14.1`
  - `14.2`
  - `15.0`
  - `current` (15.0+ at the moment)
- [Ubuntu](https://ghcr.io/greenbone/vt-test-environments/ubuntu) (`ubuntu`)
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
  - `23.04` (Lunar Lobster)
  - `23.10` (Mantic Minotaur)
  - `24.04` (Noble Numbat)
- [Alpine Linux](https://github.com/greenbone/vt-test-environments/pkgs/container/vt-test-environments/alpine) (`alpine`)
  - `3.19`
  - `3.20`
  - `3.21`
  - `3.22`
  - `edge` (rolling release)

#### Build

To build e.g. the image for Mageia 8 use:

```
docker build operating_systems/mageia --build-arg=TAG=8 -t mageia:8
```

If not specified otherwise, the image will be built with its packages explicitly not updated. This is available for most images. To build the image for Oracle Linux 5 (updated) use:

```
docker build operating_systems/oraclelinux --build-arg=TAG=5 --build-arg=UPDATED=true -t oraclelinux:5
```
