#!/bin/sh

set -g @left_separator "\ue0b0"
set -g @left_alt_separator "\ue0b1"
set -g @right_separator "\ue0b2"
set -g @right_alt_separator "\ue0b3"

set -g @base0 "#121419"
set -g @base1 "#20222d"
set -g @base2 "#21242c"
set -g @base3 "#272935"
set -g @base4 "#32343e"
set -g @base5 "#3c3f4e"
set -g @base6 "#6c6f82"
set -g @base7 "#b5b4c9"
set -g @base8 "#f0ecfe"

set -g @startrail0 "#21242c"
set -g @startrail1 "#cf8164"
set -g @startrail2 "#76a065"
set -g @startrail3 "#ab924c"
set -g @startrail4 "#8296b0"
set -g @startrail5 "#a18daf"
set -g @startrail6 "#659ea2"
set -g @startrail7 "#b5b4c9"
set -g @startrail8 "#32343e"
set -g @startrail9 "#fe9f7c"
set -g @startrail10 "#92c47e"
set -g @startrail11 "#d2b45f"
set -g @startrail12 "#a0b9d8"
set -g @startrail13 "#c6aed7"
set -g @startrail14 "#7dc2c7"
set -g @startrail15 "#f0ecfe"

set -g pane-border-style fg="colour0"
set -g pane-active-border-style fg="colour12"

set -g status-style bg="colour0",fg="colour8"

set -g status-left "#[bg=#{@startrail12}]#{?client_prefix,#[bg=#{@startrail10}],}#[fg=#{@startrail0},bold]  #S #[bg=#{@startrail4}]#[fg=#{@startrail12}]#{?client_prefix,#[fg=#{@startrail10}],}#{@left_separator}"
set -ga status-left "#[fg=#{@startrail0},nobold]  #(whoami) #[fg=#{@startrail4}]#[bg=#{@startrail0}]#{@left_separator}"

set -g window-status-separator ""
set -g window-status-format "#[fg=#{@startrail0}]#[bg=#{@startrail0}]#{@left_separator}#[fg=#{@base6},nobold]#[bg=#{@startrail0}] הּ גּ #I #{@left_alt_separator} #W #[bg=#{@startrail0}]#[fg=#{@startrail0}]#{@left_separator}"
set -g window-status-current-format "#[fg=#{@startrail0},bold]#[bg=#{@startrail12}]#{@left_separator}#[fg=#{@startrail0}]#[bg=#{@startrail12}] הּ גּ #I #{@left_alt_separator} #W #[fg=#{@startrail12}]#[bg=#{@startrail0}]#{@left_separator}"

set -g status-right "#[fg=#{@startrail4}]#[bg=#{@startrail0}]#{@right_separator}#[fg=#{@startrail0}]#[bg=#{@startrail4}]  %H:%M "
set -ga status-right "#[fg=#{@startrail12}]#[bg=#{@startrail4}]#{@right_separator}#[fg=#{@startrail0},bold]#[bg=#{@startrail12}]  #h "
