#!/bin/bash
#
# -----------------------
#
# This is a script that installs docker-ce (Docker Community Edition) on Debian 10
# Inspired by https://gist.github.com/upbeta01/3b968320b3a579c326ab6cd2a195b10d
#
# -----------------------

# Pre-requesite
sudo apt-get -y remove docker docker-engine docker.io containerd runc


# Docker Setup (repo)
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates wget curl gnupg2 software-properties-common
wget https://download.docker.com/linux/debian/gpg # note: if you don't have networking enabled for your TemplateVM use another VM to download the file and send it over to your TemplateVM via "Copy To Other AppVM..."

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

rm gpg


echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

# Install Docker
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start Docker
sudo systemctl start docker

# Do NOT enable Docker service on boot - we do this in the AppVM and change the Docker directory
# sudo systemctl enable docker

# Create a group "docker"
sudo groupadd docker

# Add user to group "docker"
sudo gpasswd -a $USER docker

# Restart Docker
sudo systemctl restart docker

# Disable - and enable in AppVM
sudo systemctl disable docker

# You may shutdown now and continue in the AppVM
# sudo shutdown now

# Now continue in AppVM:
# - change the Docker folder as described here: https://0x666f6f.bitbucket.io/2018/05/qubesos-automatically-install-and-configure-docker-ce-in-debian/
# edit before restart AppVm at /rw/config/rc.local 
# dockerd --data-root /home/user/docker
# - restart the AppVM
# - test docker using "docker run hello-world"
