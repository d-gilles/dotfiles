#!/bin/bash

echo "Loading some extentions for VS Code"
# Install the Docker extension
code --install-extension ms-azuretools.vscode-docker

# Install the GitHub Copilot extension
code --install-extension github.copilot

# Install the GitHub Copilot Chat extension
code --install-extension github.copilot-chat

# Install the HashiCorp Terraform extension
code --install-extension hashicorp.terraform

# Install the Jupyter extension
code --install-extension ms-toolsai.jupyter

# Install the Jupyter Cell Tags extension
code --install-extension lukebond.jupyter-cell-tags

# Install the Markdown Preview GitHub Styling extension
code --install-extension bierner.markdown-preview-github-styles

# Install the Python extension
code --install-extension ms-python.python

# Install the Remote Development extension
code --install-extension ms-vscode-remote.vscode-remote-extensionpack

# Installing Makefile extension for VS Code
code --install-extension ms-vscode.makefile-tools
echo "done"
echo ""
