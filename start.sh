#!/bin/bash

# Exit on any error
set -e

echo "Updating the package lists for upgrades and new package installations"
sudo apt update -y
echo "done"
echo ""

echo "Upgrading all the existing packages"
sudo apt upgrade -y
echo "done"
echo ""

echo "Making sure to get python 3.10"
sudo add-apt-repository -y ppa:deadsnakes/ppa
echo "done"
echo ""

echo "Grouped installations"
sudo apt install -y zsh curl tree python3.10-venv
echo "done"
echo ""

echo "Checking if pip is installed, if not, installing it"
type pip3 || sudo apt install -y python3-pip
echo "done"
echo ""

echo "Cleaning up unnecessary packages"
sudo apt autoremove -y
echo "done"
echo ""

echo "Installing Pyenv and Virtualenv"
if ! command -v pyenv &> /dev/null
then
  curl https://pyenv.run | bash
fi

sudo pip install virtualenv
echo "done"
echo ""

echo "Setting the PATH for Pyenv"
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
echo "done"
echo ""

echo "Installing Oh My Zsh"
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
echo "done"
echo ""

echo "Installing vs code server"
curl -fsSL https://code-server.dev/install.sh | sh
echo "done"
echo ""

echo "Running install.sh"
(zsh install.sh) || true
echo "done"
echo ""

echo "Installing direnv"
sudo apt-get update; sudo apt-get install direnv
echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
echo "done"
echo ""

echo "Fetching the GPG key for GitHub CLI's official APT repository and adding it to the keyring."
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /usr/share/keyrings/githubcli-archive-keyring.gpg > /dev/null
echo "done"
echo ""

echo "Granting read permissions on the keyring file."
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "done"
echo ""

echo "Adding GitHub CLI's official APT repository to the system's list of sources."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
echo "done"
echo ""

echo "Updating the package list."
sudo apt update
echo "done"
echo ""

echo "Installing the GitHub CLI."
sudo apt install gh -y
echo "done"
echo ""

echo "Setting up the docker repository"
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "done"
echo ""

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "done"
echo ""

echo "Installing Docker Engine"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
echo "done"
echo ""

echo "Verifying docker is running"
sudo docker run hello-world
echo "done"
echo ""

echo "Cleaning up"
sudo apt autoremove
echo "done"
echo ""
