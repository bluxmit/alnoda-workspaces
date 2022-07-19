#!/bin/bash
set -e

### Sets up S6 supervisor.

S6_VERSION=${1:-${S6_VERSION:-"v2.1.0.2"}}

# a function to install apt packages only if they are not installed
function apt_install() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            apt-get update
        fi
        apt-get install -y --no-install-recommends "$@"
    fi
}

ARCH=$(dpkg --print-architecture)

if [ "$ARCH" = "arm64" ]; then
    ARCH=aarch64
fi

DOWNLOAD_FILE=s6-overlay-${ARCH}.tar.gz

apt_install wget

## Set up S6 init system
if [ -f "/rocker_scripts/.s6_version" ] && [ "$S6_VERSION" = "$(cat /rocker_scripts/.s6_version)" ]; then
    echo "S6 already installed"
else
    wget -P /tmp/ "https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/${DOWNLOAD_FILE}"

    ## need the modified double tar now, see https://github.com/just-containers/s6-overlay/issues/288
    tar hzxf /tmp/$DOWNLOAD_FILE -C / --exclude=usr/bin/execlineb
    tar hzxf /tmp/$DOWNLOAD_FILE -C /usr ./bin/execlineb

    echo "$S6_VERSION" >/rocker_scripts/.s6_version
fi

# Clean up
rm -rf /var/lib/apt/lists/*
rm -f /tmp/$DOWNLOAD_FILE
