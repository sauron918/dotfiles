#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Setting up machine..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Please install it first: https://brew.sh/"
    exit 1
fi

echo "Installing packages..."

# stop – for configs sync
# espanso – for text replacements, it needs to be run before `stow` usage 
#    to avoid errors 'unable to load config: unable to load config'
# ghostty – terminal app 

brew install \
  stow \
  mole
  
brew install --cask \
  ghostty \
  espanso


echo "Done!"
