symbol() {
  echo " "
}

parse_git_branch() {
  local branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')

  [[ -z $branch ]] && return

  local dirty=$(git status --porcelain 2> /dev/null)

  [[ ! -z $dirty ]] && echo " %b%fon %B%F{red}$branch %F{yellow}[!?]%b%f" || echo " %b%fon %B%F{red}$branch%f%b"
}

status() {
  echo "%(?.. %b%fexited %B%F{red}%?%f%b)"
}

date() {
  local segment="at %B%F{magenta}%D{%L:%M %p}%f%b"

  echo %s $segment
}

PROMPT=$'\n'

PROMPT+=$'%F{blue}%B$(shrink_path -f)%b%f'
PROMPT+=$'%F{red}%B$(parse_git_branch)%b%f'
PROMPT+=$'$(date)'
PROMPT+=$'$(status)'
PROMPT+=$'\n'
PROMPT+=$'$(symbol)'
