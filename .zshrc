source $HOME/.confidentialrc

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Bindkeys
bindkey -e

# Aliases
alias g="git"

alias ls="eza --icons"

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
eval $(fnm env)

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

# Zemoga stuff
export AWS_CA_BUNDLE="/Library/Application Support/Netskope/STAgent/data/nscacert_combined.pem"

# export REQUESTS_CA_BUNDLE="/Library/Application Support/Netskope/STAgent/data/nscacert_combined.pem"
# export NODE_EXTRA_CA_CERTS="/Library/Application Support/Netskope/STAgent/data/nscacert_combined.pem"

export DENO_CERT="/Library/Application Support/Netskope/STAgent/data/nscacert_combined.pem"

export PYTHON="/opt/homebrew/bin/python3"

# Configure prompt
setopt PROMPT_SUBST

function git_branch {
  local branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

  if [[ ! -z "$branch" ]]; then
    echo "($branch) "
  fi
}

function node_version {
  if [[ -f "package.json"  ]]; then
    local node_version=$(node --version 2> /dev/null)

    if [[ ! -z "$node_version" ]]; then
      echo "($node_version) "
    fi
  fi
}

# Disable prompt for now
# PROMPT='%n@%m %1~ %# $(git_branch)$(node_version)'

# Haskell
[ -f "/Users/gabrielmoreno/.ghcup/env" ] && source "/Users/gabrielmoreno/.ghcup/env"

# Bun completions
[ -s "/Users/gabrielmoreno/.bun/_bun" ] && source "/Users/gabrielmoreno/.bun/_bun"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Deno
export DENO_INSTALL="/Users/gabrielmoreno/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

