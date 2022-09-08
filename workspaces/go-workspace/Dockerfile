FROM alnoda/theia-workspace:4.0

# Istall Golang
RUN cd /tmp && curl -LO https://go.dev/dl/go1.18.2.linux-amd64.tar.gz \
    && tar -xvf go1.18.2.linux-amd64.tar.gz -C /home/abc \
    && rm /tmp/go1.18.2.linux-amd64.tar.gz 

# Set environmental variables 
ENV PATH="$PATH:/home/abc/go/bin"

# Build Alnoda workspace UI
COPY --chown=abc:abc workspace /tmp/workspace
RUN alnoda-wrk build /tmp/workspace && rm -rf /tmp/workspace

# Copy new Theia settings to set another theme for the code editor
COPY --chown=abc:abc theia_settings.json /home/abc/.theia/settings.json