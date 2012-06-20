#
# Makefile for building nonroot
#

CC = gcc
CFLAGS = -std=c99 -Wall -Wextra -pedantic -O2 -s
INSTALL = install
INSTALL_PROGRAM = $(INSTALL)

prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
DESTDIR =

SHELL = /bin/sh

all: nonroot

nonroot: nonroot.c
	$(CC) $(CFLAGS) -o nonroot nonroot.c

install: nonroot
	$(INSTALL_PROGRAM) nonroot $(DESTDIR)$(bindir)/nonroot

uninstall:
	rm $(DESTDIR)$(bindir)/nonroot

clean:
	rm nonroot
