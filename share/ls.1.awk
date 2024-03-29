#!/usr/bin/env -S gawk -f
BEGIN{
	ORS=""
}
match($0, /^([0-9]* )?([-bcdlps])([-r][-w][-xsS])([-r][-w][-xsS])([-r][-w][-xtT])( +[0-9]+ +)(\w+ +)(\w+)( +[0-9\.]+[KMGT]?)(.*$)/, a) {
	# figure out how ls colored the filename
	patsplit(a[10], fcolors, /\033[^m]*m/)
	for (i=1; i < length(fcolors); i++) {
		if (fcolors[i] !~ /\033\[0*m/)
			break
	}
	# type/perms
	sub(/[bcdslp]/, fcolors[i] "&\033[0m", a[2])
	gsub(/[rwxsS]/, "\033[38;5;2m&\033[0m", a[3])
	gsub(/[sS]/, "\033[1m&", a[3])
	gsub(/[rwxsS]/, "\033[38;5;3m&\033[0m", a[4])
	gsub(/[sS]/, "\033[1m&", a[4])
	gsub(/[rwxtT]/, "\033[38;5;1m&\033[0m", a[5])
	gsub(/[tT]/, "\033[1m&", a[5])
	# user/group
	sub(/^(root|0)/, "\033[38;5;1m&\033[0m", a[7])
	sub(/^(root|0)/, "\033[38;5;1m&\033[0m", a[8])
	# size
	sub(/[0-9\.]+[K]/, "\033[38;5;2m&\033[0m", a[9])
	sub(/[0-9\.]+[M]/, "\033[38;5;3m&\033[0m", a[9])
	sub(/[0-9\.]+[G]/, "\033[38;5;1m&\033[0m", a[9])
	sub(/[0-9\.]+[T]/, "\033[38;5;9m&\033[0m", a[9])
	# rest
	for (i=1; i < 12; i++)
		print a[i]
	print "\n"
	next
}
/^/{ print $0 "\n" }
