export ZSHDIR="$HOME/.config/zsh"

export PATH="$HOME/.fig/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export EDITOR="nvim"
export LS="exa"

source "$ZSHDIR/utils/functions.zsh"

bindkey -v
bindkey ^R history-incremental-search-backward

setopt prompt_subst

plugin fnm
plugin git
plugin rbenv
plugin shrink-path
plugin zsh-syntax-highlighting
plugin zsh-z

theme gabriel

alias vim="$EDITOR"
alias ls="$LS"

alias editorconfig="$EDITOR $HOME/.config/nvim/init.vim"
alias zshconfig="$EDITOR $HOME/.config/zsh/.zshrc"

