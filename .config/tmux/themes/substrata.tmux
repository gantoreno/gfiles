#!/bin/sh

set -g pane-border-style        fg="colour0"
set -g pane-active-border-style fg="colour12"

set -g status-style bg="colour0",fg="colour8"

set -g  status-left-length 36
set -g  status-left        "#[bg=colour12]#{?client_prefix,#[bg=colour10],}#[fg=colour0,bold]  #S #[bg=colour4]#[fg=colour12]#{?client_prefix,#[fg=colour10],}"
set -ga status-left        "#[fg=colour0,nobold]  #(whoami) #[fg=colour4]#[bg=colour0]"

set -g window-status-separator      ""
set -g window-status-format         "#[fg=colour0]#[bg=colour0]#[fg=#5b5f71,nobold]#[bg=colour0]  #I  #W #[bg=colour0]#[fg=colour0]"
set -g window-status-current-format "#[fg=colour0,bold]#[bg=colour12]#[fg=colour0]#[bg=colour12]  #I  #W #[fg=colour12]#[bg=colour0]"

set -g  status-right-length 36
set -g  status-right        "#[fg=colour4]#[bg=colour0]#[fg=colour0]#[bg=colour4]  %H:%M "
set -ga status-right        "#[fg=colour12]#[bg=colour4]#[fg=colour0,bold]#[bg=colour12]  #h "
