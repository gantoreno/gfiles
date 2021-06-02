#!/bin/sh

set -g pane-border-style        fg="#2e313d"
set -g pane-active-border-style bg="#242731",fg="#a0b9d8"

set -g status-style bg="#2e313d",fg="#5b5f71"

set -g  status-left-length 36
set -g  status-left        "#[bg=#a0b9d8]#[fg=#282a36,bold]#{?client_prefix,#[bg=#92c47e]#[fg=#282a36],}  #S #[bg=#8296b0]#{?client_prefix,#[fg=#92c47e],#[fg=#a0b9d8]}"
set -ga status-left        "#[fg=#2e313d,nobold]  #(whoami) #[fg=#8296b0]#[bg=#2e313d]"

set -g window-status-separator      ""
set -g window-status-format         "#[fg=#2e313d]#[bg=#2e313d]#[fg=#5b5f71,nobold]#[bg=#2e313d]  #I  #W #[bg=#2e313d]#[fg=#2e313d]"
set -g window-status-current-format "#[fg=#2e313d,bold]#[bg=#a0b9d8]#[fg=#2e313d]#[bg=#a0b9d8]  #I  #W #[fg=#a0b9d8]#[bg=#2e313d]"

set -g  status-right-length 36
set -g  status-right        "#[fg=#8296b0]#[bg=#2e313d]#[fg=#2e313d]#[bg=#8296b0]  %H:%M "
set -ga status-right        "#[fg=#a0b9d8]#[bg=#8296b0]#[fg=#2e313d,bold]#[bg=#a0b9d8]  #h "
