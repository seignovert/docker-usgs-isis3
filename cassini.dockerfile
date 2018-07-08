FROM seignovert/usgs-isis3:bare

LABEL maintainer="Seignovert"

# Sync `Cassini` data
RUN rsync -azv --delete --partial \
    --exclude='kernels' \
    isisdist.astrogeology.usgs.gov::isis3data/data/cassini $ISIS3DATA

# Sync `Cassini` kernels
RUN rsync -azv --delete --partial \
    isisdist.astrogeology.usgs.gov::isis3data/data/cassini/kernels \
    $ISIS3DATA/cassini

CMD bash