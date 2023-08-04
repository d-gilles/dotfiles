#!/bin/zsh

# Exit on any error
set -e

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
