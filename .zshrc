# Unicode language support
export LC_ALL=en_US.UTF-8

# Keybinds
bindkey -v

bindkey ^R history-incremental-search-backward
bindkey ^S history-incremental-search-forward

# Options
setopt prompt_subst

# Editor
export EDITOR="code"

# FNM
eval "$(fnm env --use-on-cd)"

# Direnv
eval "$(direnv hook zsh)"

_direnv_hook() {
  eval "$(direnv export zsh)"

  if [ -f .envrc.functions ] && [ -n "$DIRENV_DIR" ]; then
    source .envrc.functions
  fi
}

# Zoxide
eval "$(zoxide init zsh)"

# Exports
export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$PATH:$HOME/Library/Python/3.9/bin"

export HOMEBREW_NO_AUTO_UPDATE=1

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"

# Go
export PATH="$HOME/go/bin:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# PNPM
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# AWS
export AWS_SDK_LOAD_CONFIG=1

# Python
export PYTHON="/opt/homebrew/bin/python3"

# Sdkman
export SDKMAN_DIR="$HOME/.sdkman"

[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH="$HOME/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="$HOME/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

export ZSH_THEME="robbyrussell"

plugins=(
  git
)

source "$ZSH/oh-my-zsh.sh"

# Avoid auto cd
setopt noautocd

# Aliases
alias vim="nvim"

alias cc="claude"
alias oc="opencode"

alias lzg="lazygit"

alias gck="git checkout"
alias gcp="git cherry-pick"
alias gca="git commit --amend"
alias glg="git log    --graph --oneline"
alias gsp="git status --porcelain"

alias zshconfig="vim $HOME/Developer/gantoreno/gfiles/.zshrc"
alias vimconfig="vim $HOME/Developer/gantoreno/gfiles/.config/nvim/init.lua"
alias tmuxconfig="vim $HOME/Developer/gantoreno/gfiles/.tmux.conf"
alias ghosttyconfig="vim $HOME/Developer/gantoreno/gfiles/.config/ghostty/config"
alias opencodeconfig="vim $HOME/Developer/gantoreno/gfiles/.config/opencode/opencode.json"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/gabrielmoreno/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
