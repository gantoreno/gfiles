theme() {
  local theme_path="$ZSHDIR/themes/$1.zsh-theme"

  [[ -f $theme_path ]] && source $theme_path
}

plugin() {
  local plugin_path="$ZSHDIR/plugins/$1.plugin.zsh"

  [[ -f $plugin_path ]] && source $plugin_path
}