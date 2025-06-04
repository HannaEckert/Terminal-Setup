# Aliases
alias ls="eza --tree --group --icons --level 0"
alias cat="bat"
alias top="btop"
alias lg="lazygit"

function cs() {
	cht.sh "$@" | less -Fr
}

alias vi="nvim"
alias vim="nvim"
