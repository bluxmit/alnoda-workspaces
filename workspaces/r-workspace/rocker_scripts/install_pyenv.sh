#!/bin/bash

## Install pyenv, to facilitate installation of different python versions
## Allows users to do things like:
##     pyenv install 3.7.9 # install python 3.7.9; e.g. for tensorflow 1.15.x
##     pyenv global 3.7.9  # activate as the default python
##

set -e

PYTHON_CONFIGURE_OPTS=${PYTHON_CONFIGURE_OPTS:-"--enable-shared"}

# a function to install apt packages only if they are not installed
function apt_install() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            apt-get update
        fi
        apt-get install -y --no-install-recommends "$@"
    fi
}

echo "PYTHON_CONFIGURE_OPTS=${PYTHON_CONFIGURE_OPTS}" >>"${R_HOME}/etc/R_environ"

apt_install \
    curl \
    python3-pip

python3 -m pip --no-cache-dir install --upgrade --ignore-installed pipenv

# consider a version-stable alternative for the installer?
curl https://pyenv.run | bash
mv /root/.pyenv /opt/pyenv

# pipenv requires ~/.local/bin to be on the path...
echo "PATH=/opt/pyenv/bin:~/.local/bin:$PATH" >>"${R_HOME}/etc/Renviron.site"
cat <<"EOF" >>/etc/bash.bashrc
PATH=/opt/pyenv/bin:~/.local/bin:$PATH
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
EOF

# Clean up
rm -rf /var/lib/apt/lists/*
