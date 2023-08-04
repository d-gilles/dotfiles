#!/bin/bash

# do basic installation
echo "Installing basic stuff"
(sh scripts/basic.sh) || true
echo "done"
echo ""

echo "Configuring zsh"
(zsh scripts/config.sh) || true
echo "done"
echo ""

exec zsh -l

# do python installation
echo "Installing Python stuff"
(zsh scripts/python.sh) || true
echo "done"
echo ""

# do setup installation
echo "Installing other stuff"
(zsh scripts/other_install.sh) || true
echo "done"
echo ""

# load VS Code extentions
echo "Loading VS Code extentions"
(zsh scripts/vs-code-extentions.sh) || true
echo "All extention loaded"
echo ""

clear
echo "All systems up and running ... we are good to go 👍"
echo "If you also want to use terraform, please run the following command:"
echo ">zsh scripts/setup_terraform.sh"
zsh
