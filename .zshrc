#    ______      __         _      __   Gabriel Moreno
#   / ____/___ _/ /_  _____(_)__  / /   ==============
#  / / __/ __ `/ __ \/ ___/ / _ \/ /    E-mail:   gantoreno@gmail.com
# / /_/ / /_/ / /_/ / /  / /  __/ /     Website:  https://gantoreno.com
# \____/\__,_/_.___/_/  /_/\___/_/      GitHub:   https://github.com/gantoreno
# 
# ZSH configuration file

# Run TMUX {{{
[[ -z "$TMUX" ]] && exec tmux
# }}}

# Config paths {{{
export ZSHRC="$HOME/.zshrc"
export ZSHDIR="$HOME/.zsh"
# }}}

# User configuration {{{
setopt PROMPT_SUBST

bindkey -v

autoload -U colors      && colors
autoload -U compinit    && compinit
autoload -U promptinit  && promptinit
# }}}

# Theme loader {{{
source "$HOME/powerlevel10k/powerlevel10k.zsh-theme"
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
  source "$ZSHDIR/plugins/$plugin.plugin.zsh"
end
# }}}

# Exports {{{
export CLICOLOR=1
export LSCOLORS="GxGxBxDxCxEgEdxbxgxcxd"

export EDITOR="nvim"
export EDITORRC="$([ "$EDITOR" = "nvim" ] && printf %s "~/.config/nvim/init.vim" || printf %s "~/.vimrc")"
# }}}

# Sources {{{
[[ ! -f "$HOME/.p10k.zsh"      ]] || source "$HOME/.p10k.zsh"
[[ ! -z "$(brew --prefix nvm)" ]] && source "$(brew --prefix nvm)/nvm.sh"
# }}}

# Aliases {{{
alias ls="exa --icons"

alias l="ls"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"

alias pc="peco"
alias xp="expand"
alias ws="workspace"

alias gaa="git add ."
alias gcm="git commit"
alias gst="git status"
alias glg="git log --graph"

alias vim="$EDITOR"
alias fetch="fm6000"
alias pingtest="ping 8.8.8.8"
alias fastbrew="HOMEBREW_NO_AUTO_UPDATE=1 brew"

alias zshconfig="$EDITOR $ZSHRC"
alias vimconfig="$EDITOR $EDITORRC"
alias tmuxconfig="$EDITOR ~/.tmux.conf"
alias themeconfig="$EDITOR $ZSHDIR/themes/$THEME.zsh-theme"
# }}}

# Fetch {{{
[[ $(tmux display-message -p "#P") -eq 1 ]] && fetch || true
# }}}
