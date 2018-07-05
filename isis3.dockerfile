FROM ubuntu:latest

LABEL maintainer="Seignovert"

RUN apt-get update -y \
    && apt-get install -y rsync

# Create user and home
ENV HOME /usgs
RUN useradd --create-home --home-dir ${HOME} --shell /bin/bash usgs
USER usgs
WORKDIR ${HOME}

# Setup Isis variables
ENV ISISROOT ${HOME}/isis
ENV ISIS3DATA ${HOME}/data
ENV PATH "${PATH}:${ISISROOT}/bin"

# Sync Ubuntu binaries
RUN rsync -azv --delete --partial --exclude='doc' isisdist.astrogeology.usgs.gov::x86-64_linux_UBUNTU/isis/ $ISISROOT

# Sync partial `base` data
RUN rsync -azv --delete --partial --exclude='base/dems' --exclude='base/testData' isisdist.astrogeology.usgs.gov::isis3data/data/base $ISIS3DATA

CMD bash