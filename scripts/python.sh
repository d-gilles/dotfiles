#!/bin/zsh

# Exit on any error
set -e

# Activate new configuration
echo "HERE WE GO!"
echo "setting up Python environment ..."

echo "Installing Pyenv and Virtualenv"
if command -v pyenv &> /dev/null; then
  echo "Pyenv is already installed"
  echo ""
else
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

sudo apt-get update
sudo apt-get install -y libbz2-dev ncurses-dev libffi-dev libreadline-dev libssl-dev

pyenv install 3.10.6
echo "Python 3.10.6 is installed successfully"

# check if virtualenv sandbox exists
if pyenv virtualenvs | grep -q sandbox; then
  echo "Python 3.10.6 virtual environment (sandbox) already exists"
else
  pyenv virtualenv --skip-existing 3.10.6 sandbox && echo "Python 3.10.6 virtual environment (sandbox) is created successfully"
fi

# Check if sandbox is activated
if pyenv version | grep -q sandbox; then
  echo "Virtualenv sandbox is already activated"
fi

# check if global pyenv is set to sandbox
if pyenv global | grep -q sandbox; then
  echo "Global pyenv is already set to sandbox"
else
  pyenv global sandbox && echo "Global pyenv is set to sandbox"
fi

# Check if sandbox is activated
if pyenv version | grep -q sandbox; then
  echo "Virtualenv sandbox is already activated"
else
  echo "Virtualenv sandbox is not activated"
fi

echo ""
echo "Installing Python packages"
pip install -q -r requirements.txt && echo "" && echo "Python packages are installed successfully"
pip install -q --upgrade pip && echo "pip is upgraded successfully"
echo ""
echo " All Python related stuff is done 👍"
