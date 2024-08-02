clear

# If not iside tmux, reconnect to the last tmux session or open a new one
if [ -z $TMUX ] ; then
	tmux a 2>/dev/null || tmux
fi
