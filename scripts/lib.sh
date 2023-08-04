#!/bin/zsh

# Exit on any error
set -e

echo ""
echo "Installing Python packages"
python3.10 -m pip install --upgrade pip && echo "pip is upgraded successfully"
pip install -r requirements.txt && echo "" && echo "Python packages are installed successfully"
echo ""
echo " All Python related stuff is done 👍"
