FROM ubuntu:16.04

RUN	apt-get install -y mozroots mono-devel nuget mono-xbuild && \
    mozroots --import --sync && \
    certmgr -ssl https://nugetgallery.blob.core.windows.net && \
    certmgr -ssl https://nuget.org && \
    certmgr -ssl https://go.microsoft.comapt-get update && \
    nuget update -self
