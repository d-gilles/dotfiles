#!/bin/bash

# do basic installation
echo "Installing basic stuff"
(sh scripts/basic.sh) || true
echo "done"
echo ""

echo "Configuring zsh"
(zshscripts/ config.sh) || true
echo "done"
echo ""

# do python installation
echo "Installing Python stuff"
(sh scripts/python.sh) || true
echo "done"
echo ""

# do setup installation
echo "Installing other stuff"
(sh scripts/other_install.sh) || true
echo "done"
echo ""

# load VS Code extentions
echo "Loading VS Code extentions"
(sh scripts/vs-code-extentions.sh) || true
echo "All extention loaded"
echo ""

clear
echo "All systems up and running ... we are good to go 👍"
echo "If you also want to use terraform, please run the following command:"
echo ">zsh scripts/setup_terraform.sh"
zsh
