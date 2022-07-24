#!/usr/bin/with-contenv bash
# shellcheck shell=bash

## Set our dynamic variables in Renviron.site to be reflected by RStudio Server or Shiny Server
exclude_vars="HOME PASSWORD RSTUDIO_VERSION BATCH_USER_CREATION"
for file in /var/run/s6/container_environment/*; do
    sed -i "/^${file##*/}=/d" "${R_HOME}/etc/Renviron.site"
    regex="(^| )${file##*/}($| )"
    [[ ! $exclude_vars =~ $regex ]] && echo "${file##*/}=$(cat "${file}")" >>"${R_HOME}/etc/Renviron.site" || echo "skipping ${file}"
done

## only file-owner (root) should read container_environment files:
chmod 600 /var/run/s6/container_environment/*
