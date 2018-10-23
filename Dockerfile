FROM ubuntu:18.04

# apt frontend
ENV DEBIAN_FRONTEND noninteractive

# Prepare for ppa
RUN apt-get update && apt-get install gnupg -y

# Add mono ppa
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt-get update

# Install dependencies
RUN	apt-get install -y mono-devel nuget mono-xbuild

# Import certificates
RUN certmgr -ssl https://nugetgallery.blob.core.windows.net && \
    certmgr -ssl https://nuget.org && \
    certmgr -ssl https://go.microsoft.comapt-get update

# Update nuget
RUN nuget update -self
