# Oh-My-Zsh stuff
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gabriel"

CUSTOM_LS_COLORS="Exfxcxdxbxegedabagacad"

plugins=(
  git
  fnm
  rust
  shrink-path
  z
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias g="git"

alias ls="exa"

alias vim="nvim"

alias lzg="lazygit"

alias gck="git checkout"
alias gcp="git cherry-pick"
alias gca="git commit --amend"
alias glg="git log    --graph --oneline"
alias gsp="git status --porcelain"

alias :wq="exit"

alias zshconfig="vim $HOME/Developer/Configuration/gfiles/.zshrc"
alias vimconfig="vim $HOME/Developer/Configuration/gfiles/.config/nvim/init.lua"

# Evals
eval $(fnm env)

# Exports
export LS_COLORS="$LS_COLORS:di=34;1"

export PATH="$PATH:$HOME/.scripts"
export PATH="$PATH:$HOME/.cargo/bin"

export HOMEBREW_NO_AUTO_UPDATE=1

export EDITOR="nvim"

# Zemoga stuff
export AWS_CA_BUNDLE="/Library/Application Support/Netskope/STAgent/data/nscacert_combined.pem"
export REQUESTS_CA_BUNDLE="/Library/Application Support/Netskope/STAgent/data/nscacert_combined.pem"
export NODE_EXTRA_CA_CERTS="/Library/Application Support/Netskope/STAgent/data/nscacert_combined.pem"

# Startup
if [[ $TERM_PROGRAM == "iTerm.app" && -z $NEOVIM ]]; then
  macfetch
fi
