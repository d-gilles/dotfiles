#!#!/bin/bash

sudo apt-get update
sudo apt-get install -y zsh
sudo apt-get install -y pip
curl https://pyenv.run | bash
sudo apt-get install -y tree

echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
