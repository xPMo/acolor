#!/usr/bin/env -S awk -f
BEGIN {
	FS="\t"
	OFS="\t"
	ORS=""
}
/./{
	sub(/^[0-9\.,]+[K]/, "\033[38;5;2m&\033[0m", $1) ||
	sub(/^[0-9\.,]+[M]/, "\033[38;5;3m&\033[0m", $1) ||
	sub(/^[0-9\.,]+[G]/, "\033[38;5;1m&\033[0m", $1) ||
	sub(/^[0-9\.,]+[T]/, "\033[38;5;9m&\033[0m", $1)
	if (sub(/^0/, "\033[38;5;8m&", $0) == 0) {
		print $1
		$1=""
		sub(/^(.*\/)?/, "\033[38;5;4m&\033[1m", $0)
	}
	# rest
	print $0 "\033[0m\n"
	next
}
