#!/bin/bash
# Install Terraform from APT repository

# Install repository addition dependencies
sudo apt update
sudo apt install  software-properties-common gnupg2 curl

# Import repository GPG key
curl https://apt.releases.hashicorp.com/gpg | gpg --dearmor > hashicorp.gpg
sudo install -o root -g root -m 644 hashicorp.gpg /etc/apt/trusted.gpg.d/

# With the key imported now add Hashicorp repository to your Ubuntu system
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Install terraform on your Ubuntu Linux system
sudo apt install terraform

# Check Terraform Version
terraform --version && echo "Terraform Installation successful 👍"
