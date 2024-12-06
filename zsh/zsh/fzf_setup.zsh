# fzf color scheme - catppuccin frappe
export FZF_DEFAULT_OPTS=" \
	--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
	--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
	--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

export FZF_DEFAULT_COMMAND="fdfind --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdfind --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_complete_git() {
	git branch -a --no-color | grep -v '/HEAD\s' | sed -r 's/(\*){0,1}\s*(remotes\/){0,1}//' | \
	_fzf_complete --height 40 --reverse --prompt="$1> " -- "$@"
}

_fzf_compgen_dir() {
	fd --type=d --hidden --exclude .git . "$1"
}

_fzf_comprun() {
	local command=$1
	shift

	case "$command" in
		cd)				fzf --preview 'eza --tree --icons --color=always {} | head -200' "$@" ;;
		export|unset)	fzf --preview "eval 'echo \$' {}" "$@";;
		ssh)			fzf --preview 'dig {}' "$@";;
		git)			fzf --preview 'git log -3 {} | batcat -n --color=always' "$@";;
		*)				fzf --preview 'batcat -n --color=always --line-range :500 {}' "$@";;
	esac
}

source ~/.fzf.zsh
