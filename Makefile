PREFIX ?= /usr/local
LIBS = $(wildcard share/*)

.PHONY: install
install:
	mkdir -m755 -p $(PREFIX)/share/acolor
	mkdir -m755 -p $(PREFIX)/bin
	install -m=755 $(LIBS) $(PREFIX)/share/acolor
	install -m=755 acol $(PREFIX)/bin/acol

.PHONY: uninstall
uninstall:
	rm -r $(PREFIX)/share/acolor
	rm $(PREFIX)/bin/acol

