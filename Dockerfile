FROM continuumio/miniconda3:latest

LABEL maintainer="Seignovert"

# Install shared libs and rsync
RUN apt-get -qq update && \
    apt-get install -y rsync \
    libglu1 \
    libgl1

# Set ENV variables
ENV HOME=/usgs
ENV ISISROOT=$HOME/isis3 ISIS3DATA=$HOME/data
ENV PATH=$PATH:$ISISROOT/bin

# Configure conda for `usgs` user
# [see. https://github.com/ContinuumIO/docker-images/issues/151#issuecomment-549742754]
RUN useradd --create-home --home-dir $HOME --shell /bin/bash usgs
RUN mkdir /opt/conda/envs/usgs /opt/conda/pkgs && \
    chgrp usgs /opt/conda/pkgs && \
    chmod g+w /opt/conda/pkgs && \
    touch /opt/conda/pkgs/urls.txt && \
    chown usgs /opt/conda/envs/usgs /opt/conda/pkgs/urls.txt

# Change user to `usgs` and change directory to `/usgs`.
USER usgs
WORKDIR $HOME

# INstall ISIS through conda
RUN conda config --add channels conda-forge --add channels usgs-astrogeology && \
    conda create -y --prefix ${ISISROOT} && \
    conda install -y --prefix ${ISISROOT} isis3

# Sync partial `base` data
RUN rsync -azv --delete --partial \
    --exclude='dems/*.cub' \
    --exclude='testData' \
    isisdist.astrogeology.usgs.gov::isis3data/data/base $ISIS3DATA

# Remove docs
RUN rm -rf $ISISROOT/doc $ISISROOT/docs

# Add Isis User Preferences
RUN mkdir -p $HOME/.Isis && echo "Group = UserInterface\n\
  ProgressBar      = Off\n\
  HistoryRecording = Off\n\
EndGroup\n\
\n\
Group = SessionLog\n\
  TerminalOutput = Off\n\
  FileOutput     = Off\n\
EndGroup" > $HOME/.Isis/IsisPreferences
