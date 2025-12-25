#!/bin/bash
for dir in zsh p10k vim git; do
  stow -v --target=$HOME "$dir"
done
# This is separate because it's in a slightly different directory
stow -v --target=$HOME/.ssh ssh