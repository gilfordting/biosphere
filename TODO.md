Setup checklist.

# Git + repo

-   Install git:

```sh
xcode-select --install
```

-   Clone this repo:

```sh
git clone git@github.com:gilfordting/biosphere.git
```

# Homebrew

-   Install Homebrew:

```sh
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
```

-   Check Homebrew prefix:

```sh
brew --prefix
```

-   Edit `$BREW` in `dotfiles/zsh/.zshrc`

# Script

-   Run main setup script:

```sh
./shell-setup.sh
```

# Other stuff

-   Generate SSH keys and add them to Github

Generate SSH key:

```sh
ssh-keygen -t ed25519 -C "gilfordting@gmail.com"
```

Start SSH agent:

```sh
eval "$(ssh-agent -s)"
```

Add private key to keychain:

```sh
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

Add to GitHub:

```sh
pbcopy < ~/.ssh/id_ed25519.pub
```
