FROM alnoda/alnoda-workspace:1.1

# Install Code-server and extensions
RUN wrk install code-server==4.13.0
RUN wrk install codeserver-common-extensions==0.0.1
RUN wrk install codeserver-themes-collection==0.1

# Set default codeserver theme (because why not)
COPY --chown=abc:abc settings.json /home/abc/.local/share/code-server/User/settings.json

# Update Alnoda workspace UI, icons, fonts
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace