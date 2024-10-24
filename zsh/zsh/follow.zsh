# Follow a given file and do something once it changes
function follow() {
	# Check if given file exists
	if [ -z $1 ] || [ ! -f $1 ] ; then
		echo "USAGE: follow <file to watch> [<function to execute (\\\$file can be used)>]"
		return 1
	fi

	file=$1
	showLines=10
	executeFunction="/usr/bin/clear; /usr/bin/tail -n \$showLines \"\$file\"" 

	# Check if a function is given
	if [ ! -z $2 ] ; then
		# If the parameter is a number, we use it as the line-count
		if [[ $2 =~ ^[0-9]+$ ]] ; then
			showLines=$2
		else
			executeFunction=${@:2}
		fi
	fi

	directory=$(dirname "$file")
	filename=$(basename "$file")

	eval $executeFunction
	inotifywait -q -e modify -m "$directory" | \
	while read -r event; do
		currentFile=$(echo $event | cut -d " " -f 3)

		if [ "$currentFile" = "$filename" ] ; then
			eval $executeFunction
		fi
	done
}
