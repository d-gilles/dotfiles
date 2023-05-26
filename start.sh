#!#!/bin/bash

sudo apt-get update
sudo apt-get install -y zsh
sudo apt-get install -y pip
curl https://pyenv.run | bash
sudo pip install virtualenv
sudo apt install python3.10-venv

echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
