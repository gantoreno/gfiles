# Preserve the host locale; Linux may not have en_US.UTF-8 generated.
if [[ "$OSTYPE" == darwin* ]]; then
  export LANG="${LANG:-en_US.UTF-8}"
else
  export LANG="${LANG:-C.UTF-8}"
fi

# Keybinds
bindkey -v
bindkey ^R history-incremental-search-backward
bindkey ^S history-incremental-search-forward
setopt prompt_subst

# Native packages installed by mise (or Homebrew).
for prefix in /opt/homebrew /home/linuxbrew/.linuxbrew; do
  if [[ -d "$prefix/bin" ]]; then
    path=("$prefix/bin" "$prefix/sbin" $path)
    fpath=("$prefix/share/zsh/site-functions" $fpath)
    break
  fi
done
unset prefix

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export HOMEBREW_NO_AUTO_UPDATE=1
export AWS_SDK_LOAD_CONFIG=1
export PYTHON=python3

# User-installed commands; mise activation below selects managed tool versions.
path=("$HOME/.local/bin" "$HOME/.scripts" "$HOME/.cargo/bin"
      "$HOME/.composer/vendor/bin" "$HOME/go/bin" "$HOME/.bun/bin" $path)
export BUN_INSTALL="$HOME/.bun"
if [[ "$OSTYPE" == darwin* ]]; then
  export PNPM_HOME="$HOME/Library/pnpm"
  path=("$HOME/Library/Python/3.9/bin" $path)
else
  export PNPM_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/pnpm"
fi
path=("$PNPM_HOME" $path)

if [[ -d "$HOME/.config/herd-lite/bin" ]]; then
  path=("$HOME/.config/herd-lite/bin" $path)
  export PHP_INI_SCAN_DIR="$HOME/.config/herd-lite/bin:${PHP_INI_SCAN_DIR:-}"
fi
[[ -d "$HOME/.antigravity/antigravity/bin" ]] && path=("$HOME/.antigravity/antigravity/bin" $path)
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# mise replaces fnm, SDKMAN shell activation, and per-project environment hooks.
if (( $+commands[mise] )); then
  eval "$(mise activate zsh)"
fi
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
fi

if (( $+commands[code] )); then
  export EDITOR=code
else
  export EDITOR=nvim
fi

# Oh My Zsh initializes completions, including Docker when installed.
[[ -d "$HOME/.docker/completions" ]] && fpath=("$HOME/.docker/completions" $fpath)
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="robbyrussell"
plugins=(git)
[[ -s "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# Avoid auto cd
setopt noautocd

# Aliases
alias vim="nvim"

alias cc="claude"
alias oc="opencode"

alias lzg="lazygit"

alias gck="git checkout"
alias gcp="git cherry-pick"
alias gca="git commit --amend"
alias glg="git log    --graph --oneline"
alias gsp="git status --porcelain"

alias zshconfig="vim $HOME/.zshrc"
alias vimconfig="vim $HOME/.config/nvim/init.lua"
alias tmuxconfig="vim $HOME/.tmux.conf"
alias ghosttyconfig="vim $HOME/.config/ghostty/config"
alias opencodeconfig="vim $HOME/.config/opencode/opencode.json"
