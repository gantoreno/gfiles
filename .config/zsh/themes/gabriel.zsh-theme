segment() {
  local segment="$1"

  [[ ! -z $2 ]] && segment="%F{$2}$segment%f"
  [[ $3 == 'bold' ]] && segment="%B$segment%b"
  [[ ! -z $4 ]] && segment="$4 $segment"

  echo "$segment "
}

directory() {
  local dir=$(shrink_path -f)

  [[ -z $dir ]] && return

  segment $dir blue bold
}

repository() {
  local branch=$(git_prompt_info)

  [[ -z $branch ]] && return

  segment $branch red bold on
}

date() {
  local timestamp="%B%F{magenta}%D{%L:%M %p}%f%b"

  segment $timestamp magenta bold at
}

status() {
  echo "%(?..%b%fexited %B%F{red}%?%f%b )"
}

symbol() {
  local icon=""

  segment $icon white bold
}

prompt() {
  PROMPT=$'
'

  PROMPT+=$(directory)
  PROMPT+=$(repository)
  PROMPT+=$(date)
  PROMPT+=$(status)

  PROMPT+=$'
'

  PROMPT+=$(symbol)
}

autoload -Uz add-zsh-hook

add-zsh-hook precmd prompt

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{yellow}%B[!?]%b%f"