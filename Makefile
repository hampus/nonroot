.POSIX:

CC = gcc
CFLAGS = -std=c99 -Wall -Wextra -pedantic -O2 -s

all: nonroot

nonroot: nonroot.c
	$(CC) $(CFLAGS) -o nonroot nonroot.c

clean:
	rm nonroot
