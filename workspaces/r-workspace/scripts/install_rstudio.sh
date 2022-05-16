#!/bin/bash

## Download and install RStudio server & dependencies uses.
##
## In order of preference, first argument of the script, the RSTUDIO_VERSION variable.
## ex. stable, preview, daily, 1.3.959, 2021.09.1+372, 2021.09.1-372, 2022.06.0-daily+11

set -e

RSTUDIO_VERSION=${1:-${RSTUDIO_VERSION:-"stable"}}
DEFAULT_USER=${DEFAULT_USER:-"rstudio"}

# a function to install apt packages only if they are not installed
function apt_install() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            apt-get update
        fi
        apt-get install -y --no-install-recommends "$@"
    fi
}

apt_install \
    lsb-release \
    file \
    git \
    libapparmor1 \
    libclang-dev \
    libcurl4-openssl-dev \
    libedit2 \
    libobjc4 \
    libssl-dev \
    libpq5 \
    lsb-release \
    psmisc \
    procps \
    python-setuptools \
    pwgen \
    sudo \
    wget

ARCH=$(dpkg --print-architecture)
UBUNTU_VERSION=$(lsb_release -sc)

# install s6 supervisor
/rocker_scripts/install_s6init.sh

## Download RStudio Server for Ubuntu 18+
DOWNLOAD_FILE=rstudio-server.deb

if [ "$RSTUDIO_VERSION" = "latest" ]; then
    RSTUDIO_VERSION="stable"
fi

if [ "$UBUNTU_VERSION" = "focal" ]; then
    UBUNTU_VERSION="bionic"
fi

if [ "$RSTUDIO_VERSION" = "stable" ] || [ "$RSTUDIO_VERSION" = "preview" ] || [ "$RSTUDIO_VERSION" = "daily" ]; then
    wget "https://rstudio.org/download/latest/${RSTUDIO_VERSION}/server/${UBUNTU_VERSION}/rstudio-server-latest-${ARCH}.deb" -O "$DOWNLOAD_FILE"
else
    wget "https://download2.rstudio.org/server/${UBUNTU_VERSION}/${ARCH}/rstudio-server-${RSTUDIO_VERSION/"+"/"-"}-${ARCH}.deb" -O "$DOWNLOAD_FILE" ||
        wget "https://s3.amazonaws.com/rstudio-ide-build/server/${UBUNTU_VERSION}/${ARCH}/rstudio-server-${RSTUDIO_VERSION/"+"/"-"}-${ARCH}.deb" -O "$DOWNLOAD_FILE"
fi

dpkg -i "$DOWNLOAD_FILE"
rm "$DOWNLOAD_FILE"

# https://github.com/rocker-org/rocker-versioned2/issues/137
rm -f /var/lib/rstudio-server/secure-cookie-key

## RStudio wants an /etc/R, will populate from $R_HOME/etc
mkdir -p /etc/R

## Make RStudio compatible with case when R is built from source
## (and thus is at /usr/local/bin/R), because RStudio doesn't obey
## path if a user apt-get installs a package
R_BIN=$(which R)
echo "rsession-which-r=${R_BIN}" >/etc/rstudio/rserver.conf
## use more robust file locking to avoid errors when using shared volumes:
echo "lock-type=advisory" >/etc/rstudio/file-locks

## Prepare optional configuration file to disable authentication
## To de-activate authentication, `disable_auth_rserver.conf` script
## will just need to be overwrite /etc/rstudio/rserver.conf.
## This is triggered by an env var in the user config
cp /etc/rstudio/rserver.conf /etc/rstudio/disable_auth_rserver.conf
echo "auth-none=1" >>/etc/rstudio/disable_auth_rserver.conf

## Set up RStudio init scripts
mkdir -p /etc/services.d/rstudio
cat <<"EOF" >/etc/services.d/rstudio/run
#!/usr/bin/with-contenv bash
## load /etc/environment vars first:
for line in $( cat /etc/environment ) ; do export $line > /dev/null; done
exec /usr/lib/rstudio-server/bin/rserver --server-daemonize 0
EOF

cat <<EOF >/etc/services.d/rstudio/finish
#!/bin/bash
/usr/lib/rstudio-server/bin/rstudio-server stop
EOF

# If CUDA enabled, make sure RStudio knows (config_cuda_R.sh handles this anyway)
if [ -n "$CUDA_HOME" ]; then
    sed -i '/^rsession-ld-library-path/d' /etc/rstudio/rserver.conf
    echo "rsession-ld-library-path=$LD_LIBRARY_PATH" >>/etc/rstudio/rserver.conf
fi

# Log to stderr
cat <<EOF >/etc/rstudio/logging.conf
[*]
log-level=warn
logger-type=syslog
EOF

# set up default user
/rocker_scripts/default_user.sh "${DEFAULT_USER}"

# install user config initiation script
cp /rocker_scripts/init_set_env.sh /etc/cont-init.d/01_set_env
cp /rocker_scripts/init_userconf.sh /etc/cont-init.d/02_userconf
cp /rocker_scripts/pam-helper.sh /usr/lib/rstudio-server/bin/pam-helper

# Clean up
rm -rf /var/lib/apt/lists/*

# Check the RStudio Server version
echo -e "Check the RStudio Server version...\n"

/usr/lib/rstudio-server/bin/rstudio-server version

echo -e "\nInstall RStudio Server, done!"