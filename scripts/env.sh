#!/bin/zsh

# Exit on any error
set -e

# check if virtualenv sandbox exists
if pyenv virtualenvs | grep -q sandbox; then
  echo "Python 3.10.6 virtual environment (sandbox) already exists"
else
  pyenv virtualenv 3.10.6 sandbox && echo "Python 3.10.6 virtual environment (sandbox) is created successfully"
fi

# Check if sandbox is activated
if pyenv version | grep -q sandbox; then
  echo "Virtualenv sandbox is already activated"
else
  echo "Virtualenv sandbox is not activated"
  echo "Please activate it manually"
fi

# check if global pyenv is set to sandbox
if pyenv global | grep -q sandbox; then
  echo "Global pyenv is already set to sandbox"
else
  pyenv global sandbox && echo "Global pyenv is set to sandbox"
fi
