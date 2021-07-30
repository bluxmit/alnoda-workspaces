#!/usr/bin/bash

if [ -n "${PASSWORD}" ] || [ -n "${HASHED_PASSWORD}" ]; then
    AUTH="password"
else
    AUTH="none"
    echo "starting with no password"
fi

if [ -z ${PROXY_DOMAIN+x} ]; then
    PROXY_DOMAIN_ARG=""
else
    PROXY_DOMAIN_ARG="--proxy-domain=${PROXY_DOMAIN}"
fi

export SHELL=/bin/zsh 

code-server \
    --bind-addr 0.0.0.0:8025 \
    --user-data-dir /opt/vscode/data \
    --extensions-dir /opt/vscode/extensions \
    --disable-telemetry \
    --auth "${AUTH}" \
    "${PROXY_DOMAIN_ARG}" \
    /home/project