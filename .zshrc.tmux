# Fetch
if (( $+commands[macfetch] )); then
  macfetch
fi

# Editor
export EDITOR="nvim"

# Aliases
alias ls="eza"
alias vim="nvim"

# Oh My Zsh
export ZSH_THEME="pure"

plugins=(
  $plugins
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"
