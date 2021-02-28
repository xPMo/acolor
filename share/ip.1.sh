#!/usr/bin/env sh
eval "set -- $COMMAND"
while
	shift
do
	case $1 in
	addrl*) # addrlabel
		;;
	lt*) #
		;;
	a*) # address
		;;
	r*) # route 
		awk -v ORS= '
		match($0, /^([[:alpha:]]* via )?([^\/ ]*)(\/[[:digit:]]*)?/, a) {
		sub(/[[:alpha:]]*/, "\033[01;38;5;3m&\033[0m", a[1])
		sub(/[[:digit:]]+/, "\033[38;5;2m&\033[0m", a[3])
		print a[1]
		print "\033[38;5;10m" a[2] "\033[0m"
		print a[3]
		print "\n"
		}'
		;;
	n*) # neighbor
		;;
	l*) # link
		;;
	m*) # maddress
		;;
	h) # help (only outputs to stderr)
		;;
	*)
		continue ;;
	esac
	exit
done

