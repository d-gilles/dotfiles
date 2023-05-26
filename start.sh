#!/bin/bash

sudo apt-get update
sudo apt-get install -y zsh
sudo apt-get install -y pip
curl https://pyenv.run | bash
sudo pip install virtualenv
sudo apt install -y python3.10-venv
sudo apt install tree



echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
