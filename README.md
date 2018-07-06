Dockerfile for [Isis3 (USGS)](https://isis.astrogeology.usgs.gov/)
=========================

[![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/seignovert/usgs-isis3/)
[![Docker Build Status](https://img.shields.io/docker/build/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/seignovert/usgs-isis3/)
[![GitHub license](https://img.shields.io/github/license/seignovert/docker-usgs-isis3.svg)](https://github.com/seignovert/docker-usgs-isis3/blob/master/LICENSE.md)

- Based on the latest Ubuntu (18.04 LTS currently)
- Isis3 binaries are installed in `/usgs/isis`
- Bare bone data are installed in `/usgs/data`

To run Isis3 docker container:
```bash
docker run --rm -h isis3-docker --name isis3 -i -t seignovert/usgs-isis3:bare
```

(Re)build the container
-----------------------
```bash
docker build --rm -f isis3.dockerfile -t usgs-isis3:bare .
```

Notes:
-----
1. This containner does not provide Isis3 graphic user interface, only `cli` commands are avaible.
2. `DEMS` are excluded from `data/base` files to make the image smaller.

__Important:__ I have no affiliation with USGS. The package is provided as is, use at your own risk.