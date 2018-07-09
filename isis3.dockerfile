FROM ubuntu:latest

LABEL maintainer="Seignovert"

# Add old Trusty (14.04) repo for `libicu` v.52 / `libpng` v.12
RUN echo "deb http://security.ubuntu.com/ubuntu trusty-security main"  >> /etc/apt/sources.list \
    && apt-get -qq update

# Install shared libs and rsync
RUN apt-get install -y rsync \
    libx11-6 \
    libglib2.0-0 \
    libgl1 \
    libdbus-1-3 \
    libcurl4-gnutls-dev \
    libgomp1 \
    libnss3 \
    libfontconfig1 \
    libjpeg8 \
    libxi6 \
    libxcursor1 \
    libxcomposite1 \
    libasound2 \
    libxtst6 \
    libjbig0 \
    libicu52 \
    libpng12-0

# Set ENV variables
ENV HOME=/usgs
ENV ISISROOT=$HOME/isis ISIS3DATA=$HOME/data
ENV PATH=$PATH:$ISISROOT/bin

# Create user and home
RUN useradd --create-home --home-dir $HOME --shell /bin/bash usgs
USER usgs
WORKDIR $HOME

# Sync Ubuntu binaries
RUN rsync -azv --delete --partial \
    --exclude='doc' \
    --exclude='src' \
    isisdist.astrogeology.usgs.gov::x86-64_linux_UBUNTU/isis/ $ISISROOT

# Sync partial `base` data
RUN rsync -azv --delete --partial \
    --exclude='dems' \
    --exclude='kernels' \
    --exclude='testData' \
    isisdist.astrogeology.usgs.gov::isis3data/data/base $ISIS3DATA

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

CMD bash