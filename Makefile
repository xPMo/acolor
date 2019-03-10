PREFIX ?= /usr/local
LIBS = $(wildcard lib/*)

.PHONY: install
install:
	mkdir -m755 -p $(PREFIX)/lib/acolor
	mkdir -m755 -p $(PREFIX)/bin
	install -m=755 $(LIBS) $(PREFIX)/lib/acolor
	install -m=755 acol $(PREFIX)/bin/acol

.PHONY: uninstall
uninstall:
	rm -r $(PREFIX)/lib/acolor
	rm $(PREFIX)/bin/acol

