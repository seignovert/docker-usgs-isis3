Dockerfile for [Isis3 (USGS)](https://isis.astrogeology.usgs.gov/)
=========================

[![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/seignovert/usgs-isis3/)
[![Docker Build Status](https://img.shields.io/docker/build/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/seignovert/usgs-isis3/)
[![GitHub license](https://img.shields.io/github/license/seignovert/docker-usgs-isis3.svg)](https://github.com/seignovert/docker-usgs-isis3/blob/master/LICENSE.md)

- Based on the latest Ubuntu (18.04 LTS currently)
- Isis3 binaries are installed in `/usgs/isis`
- Isis3 data are installed in `/usgs/data`

Start Isis3 on its own:
```bash
docker run -i -t seignovert/usgs-isis3:bare
```

Isis3 for Cassini
------------------
To make the image smaller, the Cassini data need to be mounted directly from the local file system when you start to run `docker`:
```bash
docker run --rm --name isis3 -h isis3-docker --volumes \ /path/to/local_cassini_kernels:/usgs/data/cassini/kernels \
-i -t seignovert/usgs-isis3:cassini
```

_Or_ you can copy the [`docker-compose.yml`](./docker-compose.yml) file and run directly:
```bash
docker-compose run --rm isis3-cassini
```

> __Note:__ If you use `docker-compose` don't forget to set `CASSINI_KERNELS` and `PDS_DATA` environment variables first (e.g. in `.env` file at the project root)

Cassini kernels
----------------
To use the SPICE routines, you may need to pull Cassini data (~30Gb) on your local file system. To retreive theses data from the USGS `isis` servers you only need to run:
```
rsync_isis3_cassini_data
```

Notes:
-----
1. `doc/src` are excluded from `isis`.
2. `dems/testData` are excluded from `data/base`.


> __Important:__ I have no affiliation with USGS. The package is provided as is, use at your own risk.