FROM seignovert/usgs-isis3:bare

LABEL maintainer="Seignovert"

# Sync `Cassini` data
RUN rsync -azv --delete --partial \
    --exclude='kernels' \
    --exclude='testData' \
    isisdist.astrogeology.usgs.gov::isis3data/data/cassini $ISIS3DATA

# # Sync `Cassini` kernels (too large)
# RUN rsync -azv --delete --partial \
#     isisdist.astrogeology.usgs.gov::isis3data/data/cassini/kernels \
#     $ISIS3DATA/cassini

CMD bash