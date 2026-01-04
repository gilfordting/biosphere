#!/bin/bash
OLD_DOTFILES="dotfile_backups_$(date -u +"%Y%m%d%H%M%S")"
mkdir $OLD_DOTFILES

function backup_if_exists() {
    if [ -f $1 ];
    then
      mv $1 $OLD_DOTFILES
    fi
    if [ -d $1 ];
    then
      mv $1 $OLD_DOTFILES
    fi
}

# Common conflicts
backup_if_exists ~/.zshrc
backup_if_exists ~/.gitconfig

for dir in zsh p10k vim git; do
  stow -v --target=$HOME "$dir"
done
# This is separate because it's in a slightly different directory
stow -v --target=$HOME/.ssh ssh