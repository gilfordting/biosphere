# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=/opt/homebrew/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin
export PATH="$PATH:/Users/gilfordting/.local/bin" # Created by `pipx` on 2024-09-09 14:49:45
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/Cellar/coreutils/9.7/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/riscv-gnu-toolchain/bin:$PATH"
# shell tools
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^[[Z' autosuggest-accept # Shift-tab for autosuggest
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
# fnm instead of nvm
eval "$(fnm env --use-on-cd --shell zsh)"
# zoxide instead of autojump
eval "$(zoxide init zsh)"

# ls replaced by colorls
# alias l='colorls --sd'
# alias la='colorls -A --sd'

# try out lsd for now?
# figure out if we want our own config later
alias l='lsd --group-directories-first'
alias la='lsd -A --group-directories-first'
alias lt='lsd --group-directories-first --tree'
# git
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git lol'
# uv
alias up='uv pip'
alias upi='uv pip install'
# npm
alias ni='npm install'
# code editors
# alias c='code'
alias c='cursor'

alias pyenv='source ~/Documents/dev/.pyenv/bin/activate'

# 6.205 commands
alias 6205_env='source ~/6205_python/bin/activate'
alias fpgacompile='lab-bc build . build.tcl' # run in /labXX
alias fpgaupload='openFPGALoader -b arty_s7_50 obj/final.bit' # run in /labXX

# 6.900 commands
# alias efi_venv='source ~/Documents/dev/classes/6.900/efi_venv/bin/activate'

# 6.S894 commands
# alias telerun='python3 /Users/gilfordting/Documents/dev/classes/6.S894/telerun/telerun.py'
alias telerun='uvx telerun'
alias trs='telerun submit'
alias trss='telerun submit -s'
alias trsf='telerun submit --force'

# 6.181 commands
alias qemuv='qemu-system-riscv64'
alias gccv='riscv64-unknown-elf-gcc'
alias gdbv='riscv64-elf-gdb'


autoload -Uz compinit && compinit

# random comment