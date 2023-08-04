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
if grep -q "deadsnakes" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
  echo "PPA: deadsnakes/ppa is already installed"
else
  echo "PPA: deadsnakes/ppa is not installed"
  sudo add-apt-repository -y ppa:deadsnakes/ppa
fi
echo "done"
echo ""


echo "Installing zsh"
if [ command -v zsh]; then
  echo "zsh is already installed"
else
  sudo apt install -y zsh
fi
echo "done"
echo ""

echo "Installing curl"
if dpkg -s curl &> /dev/null; then
  echo "curl is already installed"
else
  sudo apt install -y curl
fi
echo "done"
echo ""

echo "Installing tree"
if dpkg -s tree &> /dev/null; then
  echo "tree is already installed"
else
  sudo apt install -y tree
fi
echo "done"
echo ""

echo "Checking if pip is installed, if not, installing it"
if type pip3; then
  echo "pip is already installed"
else
  sudo apt install -y python3-pip || echo "just installed pip"
fi
echo ""

echo "Cleaning up unnecessary packages"
sudo apt autoremove -y
echo "done"
echo ""

echo "Installing Oh My Zsh"
# check if oh-my-zsh is installed
if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "Oh My Zsh is already installed"
else
  yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
  echo "done"
  echo ""
fi

echo " All basics are installed. Going to configure zsh now!"
