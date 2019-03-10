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

