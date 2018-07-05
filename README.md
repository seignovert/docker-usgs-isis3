Dockerfile for [Isis3 (USGS)](https://isis.astrogeology.usgs.gov/)
=========================

To run Isis3 docker container:
```bash
docker run --rm -h isis3-docker --name isis3 -i -t seignovert/usgs-isis3:bare
```

- Based on the latest Ubuntu (18.04 LTS currently)
- Isis3 is install in `/usgs/isis`

(Re)build the container
-----------------------
```bash
docker build --rm -f isis3.dockerfile -t usgs-isis3:bare .
```

Note:
-----
1. This containner does not provide Isis3 graphic user interface, only `cli` commands are avaible.
2. `DEMS` are excluded from `data/base` files to make the image smaller.