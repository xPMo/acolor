PREFIX ?= /usr/local
LIBS = $(wildcard lib/*)

.PHONY: install
install:
	mkdir -p $(PREFIX)/lib/acolor
	install -m=755 $(LIBS) $(PREFIX)/lib/acolor
	install -m=755 acol $(PREFIX)/bin

.PHONY: uninstall
uninstall:
	rm -r $(PREFIX)/lib/acolor
	rm $(PREFIX)/bin/acol

