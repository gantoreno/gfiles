#!/bin/sh

set -g @left_separator      "\ue0b0"
set -g @left_alt_separator  "\ue0b1"
set -g @right_separator     "\ue0b2"
set -g @right_alt_separator "\ue0b3"

set -g pane-border-style        fg="colour0"
set -g pane-active-border-style fg="colour12"

set -g status-style bg="colour0",fg="colour8"

set -g  status-left-length 36
set -g  status-left        "#[bg=colour12]#{?client_prefix,#[bg=colour10],}#[fg=colour0,bold]  #S #[bg=colour4]#[fg=colour12]#{?client_prefix,#[fg=colour10],}#{@left_separator}"
set -ga status-left        "#[fg=colour0,nobold]  #(whoami) #[fg=colour4]#[bg=colour0]#{@left_separator}"

set -g window-status-separator      ""
set -g window-status-format         "#[fg=colour0]#[bg=colour0]#{@left_separator}#[fg=#5b5f71,nobold]#[bg=olour0]  #I #{@left_alt_separator} #W #[bg=colour0]#[fg=colour0]#{@left_separator}"
set -g window-status-current-format "#[fg=colour0,bold]#[bg=colour12]#{@left_separator}#[fg=colour0]#[bg=colour12]  #I #{@left_alt_separator} #W #[fg=colour12]#[bg=colour0]#{@left_separator}"

set -g  status-right-length 36
set -g  status-right        "#[fg=colour4]#[bg=colour0]#{@right_separator}#[fg=colour0]#[bg=colour4]  %H:%M "
set -ga status-right        "#[fg=colour12]#[bg=colour4]#{@right_separator}#[fg=colour0,bold]#[bg=colour12]  #h "c
