set-option -g prefix C-a
unbind C-b

set -g default-shell /bin/zsh
set -g default-terminal "screen-256color"

# Enable mouse integration
set -g mouse on
# Sane scrolling- I don't know how this works
set -g terminal-overrides 'xterm*:smcup@:rmcup@'


