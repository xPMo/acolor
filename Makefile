PREFIX ?= /usr/local
LIBS = $(wildcard lib/*)

.PHONY: install
install:
	mkdir -p $(PREFIX)/lib/awc
	install -m=755 $(LIBS) $(PREFIX)/lib/awc
	install -m=755 awc $(PREFIX)/bin

.PHONY: uninstall
uninstall:
	rm -r $(PREFIX)/lib/awc
	rm $(PREFIX)/bin/awc

