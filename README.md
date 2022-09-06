# quake3-server

Quake 3 server based on the [ioquake3](https://github.com/ioquake/ioq3) engine with [CPMA mode](https://playmorepromode.com).

- Repositories:
  - GitHub: [github.com/adobromilskiy/quake3-server](https://github.com/adobromilskiy/quake3-server)
  - DockerHub: [adobromilskiy/quake3-server](https://hub.docker.com/r/adobromilskiy/quake3-server)


- Dockerfile: [https://github.com/adobromilskiy/quake3-server/blob/main/Dockerfile](https://github.com/adobromilskiy/quake3-server/blob/main/Dockerfile)


- Maintained by: [Alexander Dobromilskiy](https://twst.dev)

## Quick start

You need the **pak0.pk3** file mount into **/root/.q3a/baseq3/** directory.

Example:

```console
docker run -d -p 27960:27960/udp \
 -v /path/to/pak0.pk3:/root/.q3a/baseq3/pak0.pk3 \
 -e SERVER_ARGS="+set fs_game cpma +exec ffa" \
 --rm --name quake3-server adobromilskiy/quake3-server
```

Use `SERVER_ARGS` to setup server. General commands you can find on the [official CPMA website](https://playmorepromode.com/guides/cpma-server-settings).

#### Password

Default password for server is **quake3**. You can change it to set environment variable `ADMIN_PASSWORD`.


## Server settings

Add *.cfg files into baseq3 directory and use exec command to load them.

**cpma/autoexec.cfg** - default configuration file
**baseq3/ffa.cfg** - configuration file for FFA mode. You can edit it to change server settings.
