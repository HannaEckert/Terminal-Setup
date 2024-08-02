# fzf color scheme - catppuccin frappe
export FZF_DEFAULT_OPTS=" \
	--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
	--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
	--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_DEFAULT_OPTS="--preview 'batcat --color=always {}'"
export FZF_CTRL_T_OPTS="--preview 'batcat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --icons --color=always {} | head -200'"

_fzf_compgen_path() {
	fd --hidden --exclude .git . "$1"
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
		*)				fzf --preview 'batcat -n --color=always --line-range :500 {}' "$@";;
	esac
}

source ~/.local/share/fzf-git/fzf-git.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
