#!/usr/bin/env zsh

# Before running this script, do two things:
# - Run `xcode-select --install` to obtain git (necessary to get this repo).
# - Download homebrew.

# Show all commands; early exit for failures
set -x
set -e

# On MacOS, disables login message when starting a new terminal
touch ~/.hushlogin

# Install all homebrew packages in Brewfile
brew bundle -v

# Make coding workspace
mkdir -p ~/Documents/dev

# Set up global Python virtual environment
uv venv ~/Documents/dev/.pyenv
source ~/Documents/dev/.pyenv/bin/activate
uv pip install -r languages/python.txt
deactivate

# Symlink all dotfiles
cd dotfiles/
./symlink-all.sh
cd ..

# Install Claude Code (TODO: use brew cask?)
curl -fsSL https://claude.ai/install.sh | bash


# TODO set up:
# - dotfiles, symlinks?
# - various settings, like vscode/cursor