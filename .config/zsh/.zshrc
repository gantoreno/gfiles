export ZSHDIR="$HOME/.config/zsh"

export PATH="$HOME/.fig/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export EDITOR="vim"
export FETCH="macfetch"
export LS="ls"

export CLICOLOR=1
export LSCOLORS="GxGxBxDxCxEgEdxbxgxcx"

source "$ZSHDIR/utils/functions.zsh"

setopt PROMPT_SUBST

autoload -U colors && colors
autoload -U compinit && compinit
autoload -U promptinit && promptinit

bindkey ^R history-incremental-search-backward

plugin fnm
plugin git
plugin rbenv
plugin shrink-path
plugin zsh-syntax-highlighting off
plugin zsh-z

theme saturn/saturn

banner off

alias vim="$EDITOR"
alias ls="$LS"

alias editorconfig="$EDITOR $HOME/.vimrc"
alias zshconfig="$EDITOR $HOME/.config/zsh/.zshrc"
