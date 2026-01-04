#!/usr/bin/env zsh

# Before running this script, do two things:
# - Run `xcode-select --install` to obtain git. Probably necessary to get this repo anyways.
# - Download homebrew.

# Show all commands; early exit for failures
set -x
set -e

# On MacOS, disables login message when starting a new terminal
touch ~/.hushlogin

# git
xcode-select --install
# homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

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

# TODO set up:
# - various settings, like vscode/cursor

# Commands after:
# gh auth login
# rustup-init
# rustup completions zsh > $(brew --prefix)/share/zsh/site-functions/_rustup
# tldr --update