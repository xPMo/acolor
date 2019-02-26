#!/usr/bin/env bash
# shellcheck disable=2139,2140
for cmd in du env lsblk lspci nmap; do
	command -v "$cmd" > /dev/null && alias "$cmd"="acol $cmd"
done
alias ls='acol ls --color=always'
