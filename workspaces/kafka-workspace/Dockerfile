FROM alnoda/codeserver-workspace:5.0

RUN wrk install apache-kafka==3.4.0-1.fix-mis
RUN wrk install kcat
RUN wrk install trubka==3.2.1
RUN wrk install kcli==1.8.3
RUN wrk install kafkactl==1.24.0
RUN wrk install kcli==1.8.3
RUN wrk install kafkactl==1.24.0
RUN wrk install kt==13.0.0

# Set Java environmental vars
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/
ENV PATH="/usr/lib/jvm/java-17-openjdk-amd64/bin:$PATH"

# Install additional codeserver extensions 
RUN code-server --install-extension  jeppeandersen.vscode-kafka

# Set another color theme for IDE
COPY settings.json /home/abc/.theia/settings.json

# Gonfigure Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace