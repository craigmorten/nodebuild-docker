FROM ubuntu:14.04

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Add basic utils
RUN apt-get update -yq && apt-get upgrade -yq && \
    apt-get install -yq curl wget nano sudo build-essential checkinstall libssl-dev xz-utils

# Set NVM_DIR env variable
ENV NVM_DIR /usr/local/nvm

# Install latest stable version of node and npm with nvm
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash && \
    source $NVM_DIR/nvm.sh && \
    nvm install stable && \
    nvm alias default stable && \
    nvm use default

# Install stable chrome
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | tee -a /etc/apt/sources.list && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    apt-get update && \
    apt-get -y install libxpm4 libxrender1 libgtk2.0-0 libnss3 libgconf-2-4 && \
    apt-get -y install google-chrome-stable

# Set the CHROME_BIN env variable
ENV CHROME_BIN $(which chromium-browser)

# Set working directory
WORKDIR /opt/app