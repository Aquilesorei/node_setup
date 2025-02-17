#!/bin/bash
# install_nvm_node_vue.sh
# This script installs nvm, the latest LTS version of Node.js, and Vue CLI on Pop!_OS.

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Updating package lists..."
sudo apt update && sudo apt upgrade -y

echo "Installing curl (if not already installed)..."
sudo apt install -y curl

# Install nvm (Node Version Manager)
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Load nvm into the current shell session.
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  echo "Loading nvm..."
  . "$NVM_DIR/nvm.sh"
else
  echo "Error: nvm script not found."
  exit 1
fi

# Install the latest LTS version of Node.js and set it as default.
echo "Installing latest LTS version of Node.js..."
nvm install --lts
nvm use --lts

# Verify Node.js and npm installation.
echo "Node version: $(node -v)"
echo "npm version: $(npm -v)"

# Install Vue CLI globally using npm.
echo "Installing Vue CLI globally..."
npm install -g @vue/cli

# Verify Vue CLI installation.
echo "Vue CLI version: $(vue --version)"

echo "Installation completed successfully!"

