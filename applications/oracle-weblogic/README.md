# vt-test-environments/applications/oracle-weblogic

- These images contains two different versions of `Oracle WebLogic Server`
- A `--ulimit nofile=8096:8096` has been added as the container failed to start with a `library initialization failed - unable to allocate file descriptor table - out of memoryAborted (core dumped)` otherwise
- Containers can be also started with the `-d` command but by default this has been left out for easier debugging / more visible info

## Services installed

- `openssh-server` (port 22/tcp)
- `Oracle WebLogic Server` (port 7001/tcp supporting / running protocols: `iiop, t3, ldap, snmp, http`)

## Version `12.2.1.3-2018`

### General

- The image is based on `Oracle Linux Server 7.4`
- The password of the user GUI / Web user `weblogic` is created dynamically during installation (see the `----> 'weblogic' admin password: <redacted>` output when running the container)

### Build

```
docker build applications/oracle-weblogic/12.2.1.3-2018 -t oracle-weblogic:12.2.1.3-2018
```

If not specified otherwise, the image will be built with its packages explicitly not updated. To build the image with updated packages use:

```
docker build applications/oracle-weblogic/12.2.1.3-2018 --build-arg=UPDATED=true -t oracle-weblogic:12.2.1.3-2018
```

### Usage

```
docker run --rm --ulimit nofile=8096:8096 -it -p 2222:22 -p 7001:7001 oracle-weblogic:12.2.1.3-2018
```

## Version `10.3.6.0-2017`

### General

- The image is based on `Ubuntu 14.04.4 LTS`
- The password of the user GUI / Web user `weblogic` is `Oracle@123`

### Build

```
docker build applications/oracle-weblogic/10.3.6.0-2017 -t oracle-weblogic:10.3.6.0-2017
```

If not specified otherwise, the image will be built with its packages explicitly not updated. To build the image with updated packages use:

```
docker build applications/oracle-weblogic/10.3.6.0-2017 --build-arg=UPDATED=true -t oracle-weblogic:10.3.6.0-2017
```

### Usage

```
docker run --rm --ulimit nofile=8096:8096 -it -p 2222:22 -p 7001:7001 oracle-weblogic:10.3.6.0-2017
```
