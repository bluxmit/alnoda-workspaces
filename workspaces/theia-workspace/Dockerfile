FROM alnoda/alnoda-workspace:1.1

# Install Theia
RUN wrk install theia==1.29.0

# Copy custom Theia settings
COPY --chown=abc:abc theia_settings.json /home/abc/.theia/settings.json

# Set additional env vars
ENV SHELL=/bin/zsh USE_LOCAL_GIT=true 

# Update Alnoda workspace UI, icons, fonts
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace