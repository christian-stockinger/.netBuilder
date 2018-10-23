FROM ubuntu:16.04

RUN	apt-get update && \
        apt-get install -y nuget \
    	mono-devel \
    	mono-xbuild && \
    	nuget update -self \
    	mozroots && \
    mozroots --import --sync && \
    certmgr -ssl https://nugetgallery.blob.core.windows.net && \
    certmgr -ssl https://nuget.org && \
    certmgr -ssl https://go.microsoft.com