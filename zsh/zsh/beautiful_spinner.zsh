# A beautiful spinner
showProcessIdentifier() {
	if [ -z $1 ] ; then
		echo "USAGE: showProcessIdentifier <process-id>"
		return 1
	fi
	pid=$1
	verb="Processing"

	if [ ! -z $2 ] ; then
		verb=$2
	fi

	ps $pid 2>&1 >/dev/null
	if [ 0 != $? ] ; then
		echo "No running process with id: $pid"
		return 1
	fi

	echo -e " \e[32mo\e[0m ${verb}..."
	spin='⡆⠖⠲⢰⣠⣄' ; i=0
	while kill -0 $pid 2>/dev/null ; do
		i=$(( (i+1) %6 ))
		echo -e "\e[1A\e[K \e[32m${spin:$i:1}\e[0m ${verb}..."
		sleep .1
	done

	if [ 0 = $? ] ; then
		echo -e "\e[1A\e[K \e[32m✔\e[0m ${verb}..."
	else
		echo -e "\e[1A\e[K \e[31m✘\e[0m ${verb}..."
	fi
}
