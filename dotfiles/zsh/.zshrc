# --- Powerlevel10k prompt ---
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --- PATH ---
BREW="/opt/homebrew"  # $(brew --prefix)
# Homebrew
export PATH="$BREW/bin:$BREW/sbin:$PATH"
# Intel Homebrew (for dual-arch systems)
export PATH="/usr/local/bin:/usr/local/opt/riscv-gnu-toolchain/bin:$PATH"
# Standard Unix paths
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# User-specific bins
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
# Cryptex system paths
CRYPTEX_BOOTSTRAP_DIR="/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr"
export PATH="/System/Cryptexes/App/usr/bin:$CRYPTEX_BOOTSTRAP_DIR/local/bin:$CRYPTEX_BOOTSTRAP_DIR/bin:$CRYPTEX_BOOTSTRAP_DIR/appleinternal/bin:$PATH"
# Coreutils (GNU)
export PATH="$BREW/Cellar/coreutils/9.7/libexec/gnubin:$PATH"

# --- FPATH ---
# Function paths (for completions)
fpath=("$BREW/share/zsh/site-functions" $fpath)

# --- Shell tools: autosuggestions, syntax highlighting, iTerm2 integration ---
source $BREW/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^[[Z' autosuggest-accept # Shift + Tab
source $BREW/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# --- Plugins ---
# zoxide (modern autojump)
eval "$(zoxide init zsh)"
alias j='z'
# ls replacement. trying out for now; set more config settings later
alias l='lsd --group-directories-first'
alias la='lsd -A --group-directories-first'
alias lt='lsd --group-directories-first --tree'
# fnm instead of nvm
eval "$(fnm env --use-on-cd --shell zsh)"
# fzf shell integration
source <(fzf --zsh)
# setup advanced completions
autoload -Uz compinit && compinit

# --- Aliases and functions --
cdp() {  # cd to parent
  local levels=${1:-1}  # default value of 1
  local cd_path=""  # this can't be called $path because it will conflict with PATH variable
  for ((i=0; i<levels; i++)); do
    cd_path="../$cd_path"
  done
  cd "$cd_path"
}
# git
alias gs='git status'
alias gu='git pull'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git lol'
# Code editors
alias c='cursor'
# uv
alias up='uv pip'
alias upi='uv pip install'
# Global python virtual environment
alias pyenv='source ~/Documents/dev/.pyenv/bin/activate'
# npm
alias ni='npm install'

# --- Class-specific commands ---

# # 6.205
# alias 6205_env='source ~/6205_python/bin/activate'
# alias fpgacompile='lab-bc build . build.tcl' # run in /labXX
# alias fpgaupload='openFPGALoader -b arty_s7_50 obj/final.bit' # run in /labXX

# # 6.S894
# alias telerun='uvx telerun'
# alias trs='telerun submit'
# alias trss='telerun submit -s'
# alias trsf='telerun submit --force'

# # 6.181
# alias qemuv='qemu-system-riscv64'
# alias gccv='riscv64-unknown-elf-gcc'
# alias gdbv='riscv64-elf-gdb'