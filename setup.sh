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

exec zsh setup2.sh
