host() {
  local host=$(hostname)

  [[ -z $host ]] && return

  echo "($host) "
}

directory() {
  local escape="%c"

  echo "%B$escape%b "
}

git_branch() {
  local branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  local color="green"

  [[ -z $branch ]] && return

  local dirty=$(git status --porcelain 2> /dev/null)

  [[ ! -z $dirty ]] && color="red"

  echo "%B[%F{$color}$branch%f]%b "
}

symbol() {
  echo " "
}

PROMPT=$''
PROMPT+=$'$(symbol)'
PROMPT+=$'$(host)'
PROMPT+=$'$(directory)'
PROMPT+=$'$(git_branch)'
