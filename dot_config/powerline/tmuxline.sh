# This tmux statusbar config was created by tmuxline.vim
# on Sun, 08 Nov 2015

set -g status-justify "left"
set -g status "on"
set -g status-left-style "none"
set -g message-command-style "fg=colour254,bg=colour31"
set -g message-style "fg=colour254,bg=colour31"
set -g pane-border-style "fg=colour31,bg=colour255"
set -g pane-active-border-style "fg=colour31,bg=colour255"
set -g status-right-style "none"
set -g status-style "none,bg=colour24,fg=colour254"
set -g status-right-length "100"
set -g status-left-length "100"
setw -g window-status-activity-style "none,fg=colour254,bg=colour24"
setw -g window-status-separator ""
setw -g window-status-style "none,fg=colour255,bg=colour24"
set -g status-left "#[fg=colour240,bg=colour254] #S #[fg=colour254,bg=colour24,nobold,nounderscore,noitalics]"
#set -g status-right "#[fg=colour254,bg=colour24,nobold,nounderscore,noitalics]#[fg=colour240,bg=colour254]#(echo o) %I:%M %p "
set -g status-right "#[fg=colour31,bg=colour24,nobold,nounderscore,noitalics]#[fg=colour255,bg=colour31] #(/opt/cisco/anyconnect/bin/vpn state | grep -Eoi '(dis)?connected' | uniq) #[fg=colour254,bg=colour31,nobold,nounderscore,noitalics]#[fg=colour240,bg=colour254] %I:%M %p "
setw -g window-status-format "#[fg=colour24,bg=colour24,nobold,nounderscore,noitalics]#[default] #I #W #[fg=colour24,bg=colour24,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=colour24,bg=colour31,nobold,nounderscore,noitalics]#[fg=colour254,bg=colour31] #I #W #[fg=colour31,bg=colour24,nobold,nounderscore,noitalics]"

