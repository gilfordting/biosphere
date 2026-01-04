# gting's environments and configurations

These are my personal environment settings and configuration files; this repo contains everything I use to effectively manage them, including scripts to bootstrap my preferred settings onto new MacOS-based computers (as much as is programatically possible, anyways).

## Dotfiles

All dotfiles are in `dotfiles/`. Run `symlink-all.sh` to symlink each dotfile to its proper location.

## Languages

Contains information to get code environments up and running. For example, for Python I have a list of high-level packages that will automatically capture commonly used Python libraries if I install them into a `uv`-managed environment.

# random stuff/workspace

## TODO

-   editors/: vscode/cursor
    -   settings
    -   extensions
    -   user snippets
-   brew casks?? check auto updating status
-   Brewfile caveats displayed? also, can we have better batching (rn is one by one)
-   check that completions work properly -- rustup, fzf
    -   same with shell integration for everything else
    -   docker and gh are installed with homebrew?
-   vimrc

## things to try

-   more inlay hints for other languages?
-   ruff/ty (currently trying it out)
-   colorls vs eza vs lsd (currently using lsd)
-   cpp
    -   brew had `clangd-format`, `cppcheck`, `bear` (this was to get LSP stuff working with `make`)
        maybe bring these back later if I do more cpp stuff
-   git diff viewers
-   lazygit (git TUI), delta (diff), jq (json), maccy (clipboard), iina (video), AltTab (tab switcher), starship (prompt)

## random brew packages

-   `cloc`, `git-quick-stats`, `graphviz`, `rename`, `mas`

# Notes

-   `tree` is not needed if you have a modern `ls` replacement

# archive

colorls:

```sh
brew install ruby rbenv ruby-build
rbenv install ...
rbenv global ...
rbenv init
gem install colorls
```
