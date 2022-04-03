function preexec() {
  timer=$(($(gdate +%s%0N)/1000000))
}

function precmd() {
  [[ $? == "130" ]] && timer=$(($(gdate +%s%0N)/1000000))
}

function benchmark() {
  if [ $timer ]; then
    now=$(($(gdate +%s%0N)/1000000))
    elapsed=$(($now-$timer))

    result=$(format-time $elapsed)

    echo " took %B%F{yellow}$result%f%b"

    unset timer
  fi
}

parse_git_branch() {
  local branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')

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

symbol() {
  echo " "
}

PROMPT=$'\n'

PROMPT+=$'%F{blue}%B$(shrink_path -f)%b%f'
PROMPT+=$'%F{red}%B$(parse_git_branch)%b%f'
PROMPT+=$'$(date)'
PROMPT+=$'$(status)'
PROMPT+=$'$(benchmark)'
PROMPT+=$'\n'
PROMPT+=$'$(symbol)'
