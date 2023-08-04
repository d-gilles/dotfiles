#!/bin/zsh

# Exit on any error
set -e


# echo "Installing vs code server"
# curl -fsSL https://code-server.dev/install.sh | sh
# echo "done"
# echo ""


echo "Installing direnv"
sudo apt-get update; sudo apt-get install direnv
if grep -q "eval \"\$(direnv hook zsh)\"" ~/.zshrc; then
  echo "direnv is already installed"
else
  echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
fi
echo "done"
echo ""

echo "Install Github cli."
# Check if the keyring file exists
if command -v gh >/dev/null ; then
  echo "Github cli already installed"
else
  type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && sudo apt update \
  && sudo apt install gh -y
fi
echo "done"
echo ""

echo "Setting up the docker repository"
# checking if ca.certificates is installed
if command -v ca-certificates &> /dev/null; then
  echo "ca-certificates is already installed"
else
  echo "Installing ca-certificates"
  sudo apt install ca-certificates
fi

# checking if curl is installed
if command -v curl &> /dev/null; then
  echo "curl is already installed"
else
  echo "Installing curl"
  sudo apt install curl
fi

# checking if gnupg is installed
if command -v gnupg &> /dev/null; then
  echo "gnupg is already installed"
else
  echo "Installing gnupg"
  sudo apt install gnupg
fi

# Installing Docker
if ! [ -d /etc/apt/keyrings ]; then
  sudo install -m 0755 -d /etc/apt/keyrings
fi
if ! [ -f /etc/apt/keyrings/docker.gpg ]; then
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  sudo chmod a+r /etc/apt/keyrings/docker.gpg
fi

if [ -e /etc/apt/sources.list.d/docker.list ]; then
  echo "Docker APT repository already exists"
else
  echo "Loading Docker APT repository"
  echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
fi
echo "done"
echo ""

echo "Installing Docker Engine"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
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
