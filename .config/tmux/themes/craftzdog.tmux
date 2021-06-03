set -g status on
set -g status-interval 2
set -g status-style bg="colour234"

set -g status-left-length 60
set -g status-left '#[fg=colour235,bg=colour252,bold] #S #[fg=colour252,bg=colour238,nobold]#[fg=colour245,bg=colour238,bold] #(whoami) #[fg=colour238,bg=colour234,nobold]'

set-option -g pane-border-style fg=colour235 #base02
set-option -g pane-active-border-style fg=colour136,bg=colour235

set -g status-right-length 150
set -g status-right '#[fg=colour59]#[fg=colour255,bg=colour59] #[fg=colour254,bold]#[fg=colour16,bg=colour254,bold] #h '

set -g window-status-separator '#[fg=colour244,bg=colour234] '
set -g window-status-format "#[fg=colour244,bg=colour234] #I #[fg=colour240] #[default,bg=colour234]#W "
set -g window-status-current-format "#[fg=colour234,bg=colour31]#[fg=colour117,bg=colour31] #I  #[fg=colour231,bold]#W #[fg=colour31,bg=colour234,nobold]"
