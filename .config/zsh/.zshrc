#    ______      __         _      __   Gabriel Moreno
#   / ____/___ _/ /_  _____(_)__  / /   ==============
#  / / __/ __ `/ __ \/ ___/ / _ \/ /    E-mail:   gantoreno@gmail.com
# / /_/ / /_/ / /_/ / /  / /  __/ /     Website:  https://gantoreno.com
# \____/\__,_/_.___/_/  /_/\___/_/      GitHub:   https://github.com/gantoreno
# 
# ZSH configuration file

# Run TMUX {{{
# [[ -z $TMUX ]] && exec tmux -f $HOME/.config/tmux/.tmux.conf
# }}}

# Config paths {{{
export ZSHDIR="$HOME/.config/zsh"
export ZSHRC="$ZSHDIR/.zshrc"
# }}}

# User configuration {{{
setopt PROMPT_SUBST

# unsetopt PROMPT_CR

bindkey -v

autoload -U colors && colors
autoload -U compinit && compinit
autoload -U promptinit && promptinit
# }}}

# Theme loader {{{
THEME="gabriel"

[[ ! -z $THEME ]] && source $ZSHDIR/themes/$THEME.zsh-theme
# }}}

# Plugin loader {{{
plugins=(
  zsh-z
  git
  shrink-path
  zsh-autosuggestions
  zsh-syntax-highlighting/zsh-syntax-highlighting
)

foreach plugin in $plugins
  [[ -e $ZSHDIR/plugins/$plugin.plugin.zsh ]] && source $ZSHDIR/plugins/$plugin.plugin.zsh
end
# }}}

# Exports {{{
export DEFAULT_USER="gabrielmoreno"

export CLICOLOR=1
export LSCOLORS="GxGxBxDxCxEgEdxbxgxcxd"

export EDITOR="nvim"
export EDITORRC="$HOME/.config/nvim/init.vim"

export PATH="$HOME/.scripts:$PATH"
export PATH="/usr/local/Cellar/llvm/12.0.0_1/bin:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:$PATH"
# }}}

# Evals {{{
eval $(fnm env)
# }}}

# Aliases {{{
alias ls="exa"

alias l="ls"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"

alias pc="peco"
alias xp="expand"
alias ws="workspace"

alias lzg="lazygit"

alias gpl="git pull"
alias gck="git checkout"
alias gaa="git add ."
alias gcm="git commit"
alias gam="git commit --amend"
alias gst="git status --porcelain"
alias glg="git log --graph --oneline"
alias gpm="git push origin main"

alias npdev="npm run dev"
alias nptest="npm run test"
alias npstart="npm run start"
alias npbuild="npm run build"

alias vim="$EDITOR"
alias fetch="macfetch"
alias pingtest="ping 8.8.8.8"
alias fastbrew="HOMEBREW_NO_AUTO_UPDATE=1 brew"

alias zshconfig="$EDITOR $ZSHRC"
alias vimconfig="$EDITOR $EDITORRC"
alias tmuxconfig="$EDITOR ~/.config/tmux/.tmux.conf"
alias themeconfig="$EDITOR $ZSHDIR/themes/$THEME.zsh-theme"
# }}}

# Fetch {{{
if [[ $TERM_PROGRAM == "iTerm.app" ]]; then 
  fetch
fi
# }}}
