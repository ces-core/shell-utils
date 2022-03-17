NAME=ces-shell-utils
VERSION=0.1.0

DIRS=bin
INSTALL_DIRS=`find $(DIRS) -type d 2>/dev/null`
INSTALL_FILES=`find $(DIRS) -type f 2>/dev/null`
DOC_FILES=*.md
MAN_DIRS=man/man1
MAN_FILES=`find $(MAN_DIRS) -type f 2>/dev/null`

PKG_DIR=pkg
PKG_NAME=$(NAME)-$(VERSION)
PKG=$(PKG_DIR)/$(PKG_NAME).tar.gz
SIG=$(PKG_DIR)/$(PKG_NAME).asc

PREFIX?=$(HOME)/.local
INSTALL_DOC_DIR=$(PREFIX)/share/doc/$(PKG_NAME)
INSTALL_MAN_DIR=$(PREFIX)/share/man

pkg:
	mkdir -p $(PKG_DIR)

$(PKG): pkg
	git archive --output=$(PKG) --prefix=$(PKG_NAME)/ HEAD

build: $(PKG)

man:
	for dir in $(MAN_DIRS); do mkdir -p $$dir; done
	for file in $(INSTALL_FILES); do help2man --no-info --no-discard-stderr $$file | nroff -man > $(MAN_DIRS)/$$(basename $$file).1; done

$(SIG): $(PKG)
	gpg --sign --detach-sign --armor $(PKG)

sign: $(SIG)

clean:
	rm -f $(PKG) $(SIG)

all: man $(PKG) $(SIG)

test:

tag:
	git tag v$(VERSION)
	git push --tags

release: man $(PKG) $(SIG) tag

install:
	for dir in $(INSTALL_DIRS); do mkdir -p $(PREFIX)/$$dir; done
	for file in $(INSTALL_FILES); do cp $$file $(PREFIX)/$$file; done
	mkdir -p $(INSTALL_DOC_DIR)
	cp -r $(DOC_FILES) $(INSTALL_DOC_DIR)/
	mkdir -p $(INSTALL_MAN_DIR)
	cp -r $(MAN_FILES) $(INSTALL_MAN_DIR)/
	for dir in $(MAN_DIRS); do cp -r $$dir $(INSTALL_MAN_DIR)/$$(basename $$dir); done

uninstall:
	for file in $(INSTALL_FILES); do rm -rf $(PREFIX)/$$file; done
	rm -rf $(INSTALL_DOC_DIR)
	for dir in $(MAN_DIRS); do rm -rf $(INSTALL_MAN_DIR)/$$(basename $$dir); done

.PHONY: build sign clean test man tag release install uninstall all
