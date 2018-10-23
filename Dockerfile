FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
RUN	apt-get update && apt-get install -y mono-devel nuget mono-xbuild && \
    certmgr -ssl https://nugetgallery.blob.core.windows.net && \
    certmgr -ssl https://nuget.org && \
    certmgr -ssl https://go.microsoft.comapt-get update
RUN nuget update -self
