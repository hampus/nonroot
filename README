nonroot - run commands as non-root
==================================

This is a small utility for starting executables as a non-privileged user, when
running as the superuser (e.g. in an init-script).

The usage is very simple:

    nonroot username executable [arg...]

The executable will be started with the specified arguments, after switching to
the specified user. If anything goes wrong, nonroot exits with an error
message. nonroot won't allow you to specify a user with UID or GID zero, to be
on the safe side.

You only need a POSIX compliant system to be able to build and run nonroot.

Building and installing
-----------------------

The source code includes both a classic Makefile and a CMake build script.
Either can be used to build and install the application.

The simplest way is to simply type `make install`. The Makefile also lets you
specify CC, CFLAGS, DESTDIR, prefix and other variables if needed. The default
values assume that you are using GCC.

License
-------

See the LICENSE file in the source code for the license terms.

Author
------

This small utility was written by Hampus Wessman.
