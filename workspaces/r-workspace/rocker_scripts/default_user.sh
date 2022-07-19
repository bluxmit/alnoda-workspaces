#!/bin/bash
set -e

DEFAULT_USER=${1:-${DEFAULT_USER:-"rstudio"}}

if id -u "${DEFAULT_USER}" >/dev/null 2>&1; then
    echo "User ${DEFAULT_USER} already exists"
else
    ## Need to configure non-root user for RStudio
    useradd -s /bin/bash -m "$DEFAULT_USER"
    echo "${DEFAULT_USER}:${DEFAULT_USER}" | chpasswd
    addgroup "${DEFAULT_USER}" staff

    ## Rocker's default RStudio settings, for better reproducibility
    mkdir -p "/home/${DEFAULT_USER}/.rstudio/monitored/user-settings"
    cat <<EOF >"/home/${DEFAULT_USER}/.rstudio/monitored/user-settings/user-settings"
alwaysSaveHistory="0"
loadRData="0"
saveAction="0"
EOF
    chown -R "${DEFAULT_USER}:${DEFAULT_USER}" "/home/${DEFAULT_USER}"
fi

# If shiny server installed, make the user part of the shiny group
if [ -x "$(command -v shiny-server)" ]; then
    adduser "${DEFAULT_USER}" shiny
fi

## configure git not to request password each time
if [ -x "$(command -v git)" ]; then
    git config --system credential.helper 'cache --timeout=3600'
    git config --system push.default simple
fi
