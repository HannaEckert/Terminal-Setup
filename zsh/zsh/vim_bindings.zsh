# A better vim mode
bindkey -v
function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
}
source $CONFIG_PATH/zsh_vi_mode.zsh

# Tmux Pane Navigation
function tmux_left() { tmux select-pane -L }
function tmux_down() { tmux select-pane -D }
function tmux_up() { tmux select-pane -U }
function tmux_right() { tmux select-pane -R }

# Tmux Pane Splitting
function tmux_split_vertical() { tmux split-window -v }
function tmux_split_horizontal() { tmux split-window -h }

# Create ZLE widgets for each tmux function
zle -N tmux_left
zle -N tmux_down
zle -N tmux_up
zle -N tmux_right

zle -N tmux_split_vertical
zle -N tmux_split_horizontal

# Bind keys in vi command mode to tmux pane navigation
bindkey -M vicmd ' h' tmux_left
bindkey -M vicmd ' j' tmux_down
bindkey -M vicmd ' k' tmux_up
bindkey -M vicmd ' l' tmux_right

bindkey -M vicmd ' v' tmux_split_horizontal
bindkey -M vicmd ' s' tmux_split_vertical


