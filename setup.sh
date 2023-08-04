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
echo "First step of setup is done."
echo "Now setup a pyenv environment and activate it."
echo "After that please restart your terminal and run zsh scripts/setup2.sh"

exec zsh
