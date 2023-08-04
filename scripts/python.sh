#!/bin/zsh

# Exit on any error
set -e

# Activate new configuration
echo "HERE WE GO!"
echo "Setting up Python environment ..."

if [ -d /home/david/.pyenv ]; then
  echo "Pyenv is already installed"
else
  echo "Installing Pyenv"
  curl https://pyenv.run | bash
  sudo pip install virtualenv
  echo "done"
  echo ""
fi

echo "Setting the PATH for Pyenv"
# check if pyenv is in the PATH
if grep -q "export PATH=\"\$HOME/.pyenv/bin:\$PATH\"" ~/.bashrc; then
  echo "Pyenv is already in the PATH"
else
  echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
  echo "done"
  echo ""
fi

# check if pyenv init is in the PATH
if grep -q "eval \"\$(pyenv init --path)\"" ~/.bashrc; then
  echo "Pyenv init is already in the PATH"
else
  echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
  echo "done"
  echo ""
fi

# check if pyenv virtualenv-init - is in the PATH
if grep -q "eval \"\$(pyenv virtualenv-init -)\"" ~/.bashrc; then
  echo "Pyenv virtualenv-init is already in the PATH"
else
  echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
  echo "done"
  echo ""
fi

echo "Installing python3.10-venv"
sudo apt install python3.10-venv
echo "done"
echo ""

sudo apt update
sudo apt install -y libbz2-dev ncurses-dev libffi-dev libreadline-dev libssl-dev libsqlite3-dev liblzma-dev

if pyenv versions | grep -q "3.10.6"; then
  echo "Python 3.10.6 is already installed"
else
  echo "Installing Python 3.10.6"
  pyenv install 3.10.6
  echo "Python 3.10.6 is installed successfully"
  echo ""
fi
