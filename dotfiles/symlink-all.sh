#!/bin/bash

# --backup flag
BACKUP=true
for arg in "$@"; do
  case "$arg" in
    --backup) BACKUP=true ;;
    --backup=false) BACKUP=false ;;
  esac
done

OLD_DOTFILES="dotfile_backups_$(date -u +"%Y%m%d%H%M%S")"

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
if [ "$BACKUP" = "true" ]; then
  mkdir "$OLD_DOTFILES"
  backup_if_exists ~/.zshrc
  backup_if_exists ~/.gitconfig
fi

for dir in zsh p10k vim git; do
  stow -v --target=$HOME "$dir"
done
# This is separate because it's in a slightly different directory
stow -v --target=$HOME/.ssh ssh