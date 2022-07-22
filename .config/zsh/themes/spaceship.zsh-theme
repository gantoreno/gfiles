directory() {
  local dir=$(shrink_path -f | path)  

  [[ -z $dir ]] && return

  echo "%B%F{blue}$dir%f%b "
}

git_branch() {
  local branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')

  [[ -z $branch ]] && return

  local dirty=$(git status --porcelain 2> /dev/null)

  [[ ! -z $dirty ]] && echo "%b%fon %B%F{magenta} $branch %F{red}[!?]%b%f " || echo "%b%fon %B%F{magenta} $branch%f%b "
}

package_version() {
  [[ ! -f "package.json" ]] && return

  local version=$(node -p "require('./package.json').version")

  [[ -z $version ]] && return

  echo "is %B%F{red} $version%f%b "
}

node_version() {
  [[ ! -f "package.json" ]] && return

  local version=$(node --version)

  echo "via %B%F{green} $version%f%b "
}


symbol() {
  echo "%B%F{%(?.green.red)}❯%f%b "
}

PROMPT=$'\n'
PROMPT+=$'$(directory)'
PROMPT+=$'$(git_branch)'
PROMPT+=$'$(package_version)'
PROMPT+=$'$(node_version)'
PROMPT+=$'\n'
PROMPT+=$'$(symbol)'
