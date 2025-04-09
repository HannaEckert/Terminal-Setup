# Aliases
alias ls="eza --tree --group --icons --level 1"
alias cat="bat"
alias top="btop"

function cs() {
	cht.sh "$@" | less -Fr
}

alias vi="nvim"
alias vim="nvim"
