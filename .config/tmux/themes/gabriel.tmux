#!/bin/sh

set -g @left_separator "\ue0b0"
set -g @left_alt_separator "\ue0b1"
set -g @right_separator "\ue0b2"
set -g @right_alt_separator "\ue0b3"

set -g @base0 "#101010"
set -g @base1 "#131313"
set -g @base2 "#171717"
set -g @base3 "#1b1b1b"
set -g @base4 "#202020"
set -g @base5 "#2b2b2b"
set -g @base6 "#2d2d2d"
set -g @base7 "#3a3a3a"
set -g @base8 "#404040"

set -g @gabriel0  "#1b1b1b"
set -g @gabriel1  "#ac616a"
set -g @gabriel2  "#98b386"
set -g @gabriel3  "#bfa86b"
set -g @gabriel4  "#7ba2c3"
set -g @gabriel5  "#999dd4"
set -g @gabriel6  "#8ac6c7"
set -g @gabriel7  "#d0d0d0"
set -g @gabriel8  "#2b2b2b"
set -g @gabriel9  "#b3646e"
set -g @gabriel10 "#a0bc8d"
set -g @gabriel11 "#c9b16f"
set -g @gabriel12 "#7fa7c9"
set -g @gabriel13 "#a2a6d4"
set -g @gabriel14 "#91cecf"
set -g @gabriel15 "#e0e0e0"

set -g pane-border-style fg="colour0"
set -g pane-active-border-style fg="colour8"

set -g status-justify centre
set -g status-style bg="default",fg="colour8"

set-hook -g window-renamed { if -F "#{==:#{window_name},nvim}" "set status-style 'bg=#171717'" "set status-style 'bg=default,fg=#2b2b2b'" }
set-hook -g session-window-changed { if -F "#{==:#{window_name},nvim}" "set status-style 'bg=#171717'" "set status-style 'bg=default,fg=#2b2b2b'" }

set -g window-status-separator ""
set -g window-status-format "#[fg=#{@gabriel8}]#W "
set -g window-status-current-format "#[fg=#{@gabriel15},nobold] on #[fg=#{@gabriel2},bold]#W "

set -g status-left "#[fg=#{@gabriel4},bold]#(whoami)"
set -ga status-left "#[fg=#{@gabriel15},nobold] at #[fg=#{@gabriel1},bold](#S)"

set -g status-right "#[fg=#{@gabriel15},nobold]in #[fg=#{@gabriel5},bold]#h"
