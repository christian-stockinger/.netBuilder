FROM ubuntu:16.04

RUN	apt-get update && apt-get install -y mono-devel nuget mono-xbuild && \
    mozroots --import --sync && \
    certmgr -ssl https://nugetgallery.blob.core.windows.net && \
    certmgr -ssl https://nuget.org && \
    certmgr -ssl https://go.microsoft.comapt-get update
RUN nuget update -self
