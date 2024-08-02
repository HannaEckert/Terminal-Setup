# Autocompletion
autoload -Uz compinit
compinit -D

# Various handy tools
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(zoxide init --cmd cd zsh)"
eval "$(thefuck --alias)"
eval "$(starship init zsh)"
