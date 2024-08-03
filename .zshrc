export LC_ALL=en_US.UTF-8

[[ -z "$TMUX" ]] && exec tmux -u

source $HOME/.confidentialrc

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="spaceship"
eval "$(starship init zsh)"

plugins=(
  git
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Bindkeys
bindkey -e

# Aliases
alias g="git"

alias ls="eza"

alias vim="nvim"

alias lzg="lazygit"

alias gck="git checkout"
alias gcp="git cherry-pick"
alias gca="git commit --amend"
alias glg="git log    --graph --oneline"
alias gsp="git status --porcelain"

alias :wq="exit"

alias zshconfig="vim $HOME/Developer/Configuration/gfiles/.zshrc"
alias vimconfig="vim $HOME/Developer/Configuration/gfiles/.config/nvim/init.lua"

# Evals
eval "$(fnm env --use-on-cd)"

# NVM
# 
# export NVM_DIR="$HOME/.nvm"
# 
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Sources
source "$HOME/.local/share/z.zsh"

# Exports
export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/.cargo/bin"

export HOMEBREW_NO_AUTO_UPDATE=1

export EDITOR="nvim"

# Haskell
[ -f "/Users/gabrielmoreno/.ghcup/env" ] && source "/Users/gabrielmoreno/.ghcup/env"

# Bun completions
[ -s "/Users/gabrielmoreno/.bun/_bun" ] && source "/Users/gabrielmoreno/.bun/_bun"

# Go
export PATH="$HOME/go/bin:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Deno
export DENO_INSTALL="/Users/gabrielmoreno/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# PNPM
export PNPM_HOME="/Users/gabrielmoreno/Library/pnpm"

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# SST
export PATH=/Users/gabrielmoreno/.sst/bin:$PATH

# AWS
export AWS_SDK_LOAD_CONFIG=1

# Zemoga stuff
export AWS_CA_BUNDLE="/Library/Application Support/Netskope/STAgent/data/nscacert_combined.pem"

# export REQUESTS_CA_BUNDLE="/Library/Application Support/Netskope/STAgent/data/nscacert_combined.pem"
# export NODE_EXTRA_CA_CERTS="/Library/Application Support/Netskope/STAgent/data/nscacert_combined.pem"

export DENO_CERT="/Library/Application Support/Netskope/STAgent/data/nscacert_combined.pem"

export PYTHON="/opt/homebrew/bin/python3"

