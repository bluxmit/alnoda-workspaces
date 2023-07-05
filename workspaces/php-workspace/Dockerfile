FROM alnoda/theia-workspace:5.0

RUN wrk install phpbrew
RUN phpbrew install 8.1.17 +default 
RUN wrk install php-composer==2.5.8

# Install more PHP modules
RUN sudo add-apt-repository -y ppa:ondrej/php \
    && sudo apt-get update \
    && sudo apt-get install -y php8.1-cli php8.1-common php8.1-mysql php8.1-zip php8.1-gd php8.1-mbstring php8.1-curl php8.1-xml php8.1-bcmath

# Custom Theia settings
COPY settings.json /home/abc/.theia/settings.json

# Gonfigure Alnoda workspace
COPY --chown=abc:abc workspace /tmp/workspace
RUN wrk build /tmp/workspace && rm -rf /tmp/workspace