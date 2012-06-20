#
# Makefile for building nonroot
#

CC = gcc
CFLAGS = -std=c99 -Wall -Wextra -pedantic -O2 -g
INSTALL = install -D
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644

prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
datarootdir = $(prefix)/share
mandir = $(datarootdir)/man
man8dir = $(mandir)/man8
DESTDIR =

SHELL = /bin/sh
MAKE = make

all: nonroot

nonroot: nonroot.c
	$(CC) $(CFLAGS) -o nonroot nonroot.c

install: nonroot
	$(INSTALL_PROGRAM) nonroot $(DESTDIR)$(bindir)/nonroot
	$(INSTALL_DATA) nonroot.8 $(DESTDIR)$(man8dir)/nonroot.8

install-strip:
	$(MAKE) INSTALL_PROGRAM="$(INSTALL_PROGRAM) -s" install

uninstall:
	rm $(DESTDIR)$(bindir)/nonroot
	rm $(DESTDIR)$(man8dir)/nonroot.8

clean distclean:
	rm nonroot
