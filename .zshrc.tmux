# Oh My Zsh
export ZSH_THEME="pure"

plugins=(
  git
  z
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# Fetch
if (( $+commands[macfetch] )); then
  macfetch
fi

# Editor
export EDITOR="nvim"

# Aliases
alias ls="eza"
alias vim="nvim"

