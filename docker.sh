!/usr/bin/bash

# install docker desktop

# Uninstall the tech preview or beta version of Docker Desktop for Linux. Run:
sudo apt remove docker-desktop -y

# For a complete cleanup, remove configuration and data files 
# at $HOME/.docker/desktop, the symlink at /usr/local/bin/com.docker.cli, 
# and purge the remaining systemd service files.
rm -r $HOME/.docker/desktop
sudo rm /usr/local/bin/com.docker.cli -y
sudo apt purge docker-desktop

# for non-Gnome Desktop environments, gnome-terminal must be installed:

sudo apt install gnome-terminal -y


# Set up the repository
sudo apt-get update -y

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker’s official GPG key:
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Use the following command to set up the repository:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

##############################################################################################

# Install Docker Engine
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# To install a specific version of Docker Engine, list the available versions in the repo, then select and install:
# a. List the versions available in your repo:
apt-cache madison docker-cleanup

# Install a specific version using the version string from the second column
sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io docker-compose-plugin



## To create the docker group and add your user:

sudo groupadd docker

# Add your user to the docker group.

sudo usermod -aG docker $USER




