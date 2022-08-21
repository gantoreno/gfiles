theme() {
  local path="$ZSHDIR/themes/$1.zsh-theme"

  [[ -f $path ]] && source $path
}

plugin() {
  local path="$ZSHDIR/plugins/$1.plugin.zsh"

  [[ -f $path ]] && source $path
}