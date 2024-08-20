# If not iside tmux, reconnect to the last tmux session or open a new one
if [[ -z $SKIP_TMUX_INIT && -z $TMUX ]] ; then
	clear
	tmux a 2>/dev/null || tmux
fi
