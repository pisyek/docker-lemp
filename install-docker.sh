#!/bin/sh
set -eu

# Remove old Docker and install latest version
sudo apt remove -y docker docker-engine docker.io containerd runc \
    && sudo apt update -y \
    && sudo apt install -y --no-install-recommends apt-transport-https ca-certificates curl gnupg-agent software-properties-common \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
    && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    && sudo apt update -y \
    && sudo apt install -y --no-install-recommends docker-ce docker-ce-cli containerd.io \
    && sudo usermod -aG docker "$USER" \
    && sudo systemctl enable docker 

echo "\n\nDocker installation is finished.\n\n"

# Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" \
        -o /usr/local/bin/docker-compose \
    && sudo chmod +x /usr/local/bin/docker-compose \
    && sudo curl -L https://raw.githubusercontent.com/docker/compose/1.25.0/contrib/completion/bash/docker-compose \
        -o /etc/bash_completion.d/docker-compose

echo "\n\nDocker-compose installation is finished. Please relogin.\n\n"
