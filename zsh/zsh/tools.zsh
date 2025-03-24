# Autocompletion
autoload -Uz compinit
compinit -D

# Various handy tools
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
