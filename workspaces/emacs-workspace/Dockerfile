FROM alnoda/base-devspace:4.0

COPY --chown=abc:abc ./emacs.d/ /home/abc/.emacs.d/

RUN echo "------------------------------------------------------ emacs" \
    && sudo add-apt-repository -y ppa:kelleyk/emacs \
    && sudo apt-get -y update \
    && sudo apt-get install -y emacs28-nox \
    && echo "------------------------------------------------------ themes" \
    && mkdir -p /home/abc/.emacs.d/themes \
    && cd /tmp && git clone https://github.com/arcticicestudio/nord-emacs.git \
    && mv /tmp/nord-emacs/nord-theme.el /home/abc/.emacs.d/themes/nord-theme.el \
    && rm -rf /tmp/nord-emacs

# Build Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN echo "------------------------------------------------------ build workspace" \
    && pipx install alnoda-wrk \
    && alnoda-wrk build /tmp/workspace \ 
    && rm -rf /tmp/workspace
