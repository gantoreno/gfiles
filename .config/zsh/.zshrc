export ZSHDIR="$HOME/.config/zsh"

export PATH="$HOME/.fig/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export EDITOR="vim"
export FETCH="macfetch"
export LS="ls"

export CLICOLOR=1
export LSCOLORS="GxGxBxDxCxEgEdxbxgxcxd"

source "$ZSHDIR/utils/functions.zsh"

setopt promptsubst

bindkey -v
bindkey ^R history-incremental-search-backward

plugin fnm
plugin git
plugin rbenv
plugin shrink-path
plugin zsh-syntax-highlighting off
plugin zsh-z

theme basic

banner off

alias vim="$EDITOR"
alias ls="$LS"

alias editorconfig="$EDITOR $HOME/.vimrc"
alias zshconfig="$EDITOR $HOME/.config/zsh/.zshrc"

