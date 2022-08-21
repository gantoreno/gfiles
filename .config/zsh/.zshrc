export ZSHDIR="$HOME/.config/zsh"

source "$ZSHDIR/utils/functions.zsh"

bindkey -v
bindkey ^R history-incremental-search-backward

export EDITOR="nvim"
export LS="exa"

export PATH="$HOME/.fig/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

plugin fnm
plugin git
plugin rbenv
plugin shrink-path
plugin zsh-syntax-highlighting
plugin zsh-z

theme gabriel

alias vim="$EDITOR"
alias ls="$LS"

alias vimconfig="$EDITOR $HOME/.config/nvim/init.vim"
alias zshconfig="$EDITOR $HOME/.config/zsh/.zshrc"

if [[ $TERM_PROGRAM == "iTerm.app" && $(type macfetch) ]]; then
  macfetch
fi
