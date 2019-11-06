Dockerfile for [Isis3 (USGS)](https://isis.astrogeology.usgs.gov/)
=========================

[![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/seignovert/docker-usgs-isis3?label=latest)](https://hub.docker.com/r/seignovert/usgs-isis3/tags)
[![Docker Automated build](https://img.shields.io/docker/automated/seignovert/usgs-isis3.svg)](https://hub.docker.com/r/seignovert/usgs-isis3/)
[![Docker Build Status](https://img.shields.io/docker/build/seignovert/usgs-isis3.svg)](https://hub.docker.com/r/seignovert/usgs-isis3/)
[![GitHub license](https://img.shields.io/github/license/seignovert/docker-usgs-isis3.svg)](https://github.com/seignovert/docker-usgs-isis3/blob/master/LICENSE.md)

- Based on the latest `continuumio/miniconda3`
- Isis3 binaries are installed in `/usgs/isis/bin`
- Isis3 data are installed in `/usgs/data`

Start Isis3 docker container:
```bash
docker run --rm -it seignovert/usgs-isis3
```

Docker compose
------
To (re)build the container:
```bash
docker-compose build
```

To start the container with `PDS_DATA` shared folders:
```bash
docker-compose run --rm isis3
```

> __Note:__ `PDS_DATA` environment variables can be defined ub `.env` file, at the project root.

Notes:
-----
- `dems` and `testData` folders are excluded from `data/base`.

> __Important:__ I have no affiliation with USGS. The package is provided as is, use at your own risk.