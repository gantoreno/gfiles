# Saturn prompt
#
# Author: Gabriel Moreno, gantoreno@gmail.com
# License: MIT
# https://github.com/hollandsgabe/saturn-prompt

# Saturn's current version
export SATURN_VERSION="0.1.2"

# +-----------------------------------------------------------+
# | PROMPT VARIABLES                                          |
# | Dynamic values that can be configured/overriden in .zshrc |
# +-----------------------------------------------------------+

# Prompt icons
SATURN_PROMPT_ICON="${SATURN_PROMPT_ICON="🪐"}"
SATURN_PROMPT_MARK="${SATURN_PROMPT_MARK="➜"}"

# Path
SATURN_PATH_COLOR="${SATURN_PATH_COLOR="cyan"}"

# Time
SATURN_TIME_ICON="${SATURN_TIME_ICON="⏰"}"
SATURN_TIME_COLOR="${SATURN_TIME_COLOR="yellow"}"
SATURN_TIME_FORMAT="${SATURN_TIME_FORMAT="%D{%L:%M %p}"}"

# Error/success status
SATURN_SUCCESS_COLOR="${SATURN_SUCCESS_COLOR="green"}"
SATURN_SUCCESS_ICON="${SATURN_SUCCESS_ICON="✔"}"
SATURN_ERROR_COLOR="${SATURN_ERROR_COLOR="red"}"
SATURN_ERROR_ICON="${SATURN_ERROR_ICON="✘"}"

# Git prompt
SATURN_GIT_PROMPT_SYMBOL="${SATURN_GIT_PROMPT_SYMBOL="🌳"}"
SATURN_GIT_PROMPT_COLOR="${SATURN_GIT_PROMPT_COLOR="magenta"}"
SATURN_GIT_PROMPT_COLOR_DIRTY="${SATURN_GIT_PROMPT_COLOR_DIRTY="red"}"

# Git elements
ZSH_THEME_GIT_PROMPT_PREFIX=" on %B%F{$SATURN_GIT_PROMPT_COLOR}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f%b"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{$SATURN_GIT_PROMPT_COLOR_DIRTY}❗️%f"
ZSH_THEME_GIT_PROMPT_CLEAN=" 🌳"

# +------------------------------------------------+
# | PROMPT                                         |
# | Build the prompt based on the config variables |
# +------------------------------------------------+

# Prompt
PROMPT=$''

# Use shrink_path if present
# Otherwise, fallback to regular path
if [[ "$plugins" =~ "shrink-path" ]] then
  PROMPT+='
%B%F{$SATURN_PATH_COLOR}$(shrink_path -f)%f%b '
else
  PROMPT+='
%B%F{$SATURN_PATH_COLOR}$(shrink_path -f)%f%b '
fi

# Prompt
PROMPT+="$SATURN_PROMPT_ICON"

# VCS
PROMPT+='$(git_prompt_info) '


# Time
PROMPT+="at %B%F{yellow}$SATURN_TIME_FORMAT $SATURN_TIME_ICON%f%b"

# Prompt mark
PROMPT+='
%(?.%F{$SATURN_SUCCESS_COLOR}.%F{$SATURN_ERROR_COLOR})%B$SATURN_PROMPT_MARK%b%f '
