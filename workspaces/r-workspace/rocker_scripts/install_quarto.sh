#!/bin/bash

## Install quarto cli or symlink quarto cli so they are available system-wide.
##
## In order of preference, first argument of the script, the QUARTO_VERSION variable.
## ex. latest, default, 0.9.16
##
## 'default' means the version bundled with RStudio if RStudio is installed, but 'latest' otherwise.
## 'latest' means installing the latest release version.

set -e

## build ARGs
NCPUS=${NCPUS:--1}

QUARTO_VERSION=${1:-${QUARTO_VERSION:-"latest"}}
# Only amd64 build can be installed now
ARCH=$(dpkg --print-architecture)

# a function to install apt packages only if they are not installed
function apt_install() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            apt-get update
        fi
        apt-get install -y --no-install-recommends "$@"
    fi
}

apt_install wget

if [ -x "$(command -v quarto)" ]; then
    INSTALLED_QUARTO_VERSION=$(quarto --version)
fi

# Check RStudio bundled quarto cli
if [ -f "/usr/lib/rstudio-server/bin/quarto/bin/quarto" ]; then
    BUNDLED_QUARTO="/usr/lib/rstudio-server/bin/quarto/bin/quarto"
fi

if [ -n "$BUNDLED_QUARTO" ]; then
    BUNDLED_QUARTO_VERSION="$($BUNDLED_QUARTO --version)"
fi

# Install quarto cli
if [ "$QUARTO_VERSION" != "$INSTALLED_QUARTO_VERSION" ]; then

    # Check RStudio bundled quarto cli
    if [ "$QUARTO_VERSION" = "default" ] && [ -z "$BUNDLED_QUARTO" ]; then
        QUARTO_VERSION="latest"
    fi

    if [ "$QUARTO_VERSION" = "$BUNDLED_QUARTO_VERSION" ] || [ "$QUARTO_VERSION" = "default" ]; then
        ln -fs "$BUNDLED_QUARTO" /usr/local/bin
    else
        if [ "$QUARTO_VERSION" = "latest" ]; then
            QUARTO_DL_URL=$(wget -qO- https://api.github.com/repos/quarto-dev/quarto-cli/releases/latest | grep -oP "(?<=\"browser_download_url\":\s\")https.*${ARCH}\.deb")
        else
            QUARTO_DL_URL="https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-${ARCH}.deb"
        fi
        wget "$QUARTO_DL_URL" -O quarto.deb
        dpkg -i quarto.deb
        rm quarto.deb
    fi

    quarto check install

fi

# Install the quarto R package
install2.r --error --skipmissing --skipinstalled -n "$NCPUS" \
    knitr \
    quarto

# Clean up
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/downloaded_packages
