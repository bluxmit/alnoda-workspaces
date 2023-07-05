FROM alnoda/openvscode-workspace:1.0

RUN wrk install ruby==3.1.2

# Install bundler in addition
RUN /home/abc/.rbenv/shims/gem install bundler

# Gonfigure Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace
