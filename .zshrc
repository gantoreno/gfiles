if [[ $TERM_PROGRAM == 'ghostty' ]]; then
  if [[ -z $TMUX ]]; then
    exec tmux
  fi
fi

# Fetch
if [[ $TERM_PROGRAM == 'tmux' ]]; then
  macfetch 2> /dev/null || echo "Macfetch not installed, skipping...\n"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ $TERM_PROGRAM == 'tmux' ]]; then;
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
fi


# Unicode language support
export LC_ALL=en_US.UTF-8

# Keybinds
bindkey -v

bindkey ^R history-incremental-search-backward
bindkey ^S history-incremental-search-forward

# Options
setopt prompt_subst

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

export ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  z
)

if [[ $TERM_PROGRAM == 'tmux' ]]; then
  plugins=($plugins zsh-syntax-highlighting)
fi

source "$ZSH/oh-my-zsh.sh"

# Prompt
fpath+=($HOME/.zsh/pure)

autoload -U promptinit && promptinit

# prompt pure

# Editor
export EDITOR="cursor"

if [[ $SUB_TERM_PROGRAM == 'ghostty' ]]; then
  export EDITOR="nvim"
fi

# Aliases
if [[ $TERM_PROGRAM == 'tmux' ]]; then
  alias ls="eza"
  alias vim="nvim"
fi

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
alias starshipconfig="vim $HOME/Developer/gantoreno/gfiles/.config/starship.toml"
alias aerospaceconfig="vim $HOME/Developer/gantoreno/gfiles/.config/aerospace/aerospace.toml"

# Evals
eval "$(fnm env --use-on-cd)"

# Exports
export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/.cargo/bin"

export HOMEBREW_NO_AUTO_UPDATE=1

# Haskell
[ -f "/Users/gabrielmoreno/.ghcup/env" ] && source "/Users/gabrielmoreno/.ghcup/env"

# Bun completions
[ -s "/Users/gabrielmoreno/.bun/_bun" ] && source "/Users/gabrielmoreno/.bun/_bun"

# XDG
export XDG_CONFIG_HOME="$HOME/.config"

# Go
export PATH="$HOME/go/bin:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Deno
export DENO_INSTALL="/Users/gabrielmoreno/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# PNPM
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# SST
export PATH=/Users/gabrielmoreno/.sst/bin:$PATH

# AWS
export AWS_SDK_LOAD_CONFIG=1

# Python
export PYTHON="/opt/homebrew/bin/python3"

# Sdkman
export SDKMAN_DIR="$HOME/.sdkman"

[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH="/Users/gabrielmoreno/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/gabrielmoreno/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Claude & Vertex
export CLAUDE_CODE_USE_VERTEX=1
export CLOUD_ML_REGION=global
export ANTHROPIC_VERTEX_PROJECT_ID=devbox-437222
export VERTEX_REGION_CLAUDE_3_5_HAIKU=us-east5

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/Developer/gantoreno/gfiles/.p10k.zsh.
[[ ! -f ~/Developer/gantoreno/gfiles/.p10k.zsh ]] || source ~/Developer/gantoreno/gfiles/.p10k.zsh
