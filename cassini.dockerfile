FROM seignovert/usgs-isis3:bare

LABEL maintainer="Seignovert"

# Sync `Cassini` data
RUN echo "\n\
alias rsync_isis3_cassini_data='rsync -azv --delete --partial \
--exclude=\"testData\" \
isisdist.astrogeology.usgs.gov::isis3data/data/cassini/ \
$ISIS3DATA/cassini'" >> $HOME/.bashrc
