# Shims make managed tools available to non-interactive Zsh scripts too.
typeset -U path PATH
path=("${MISE_DATA_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/mise}/shims" "$HOME/.local/bin" $path)
