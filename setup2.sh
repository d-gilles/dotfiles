#!/bin/zsh

# do setup installation
echo "Installing other stuff"
(zsh scripts/other_install.sh) || true

# load VS Code extentions
echo "Loading VS Code extentions"
(zsh scripts/vs-code-extentions.sh) || true
echo "All extention loaded"
echo ""


echo "All systems up and running ... we are good to go 👍"
echo "If you also want to use terraform, please run the following command:"
echo "zsh scripts/setup_terraform.sh"
zsh
