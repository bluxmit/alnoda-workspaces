#!/bin/bash

R_DOC_DIR=$R_HOME/doc
R_INCLUDE_DIR=$R_HOME/include
R_SHARE_DIR=$R_HOME/share
RSTUDIO_DEFAULT_R_VERSION_HOME=$R_HOME
RSTUDIO_DEFAULT_R_VERSION=$R_VERSION
PATH=$PATH:/usr/lib/rstudio-server/bin
rsession --standalone=1 \
         --program-mode=server \
         --session-timeout-minutes=0 \
         --user-identity=rstudio \
         --www-port=8787
