#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <unistd.h>
#include <sys/types.h>
#include <pwd.h>

/* Print an error message and call exit() */
void error_exit(const char *msg)
{
    fprintf(stderr, "nonroot: %s\n", msg);
    if(errno) {
        fprintf(stderr, "%s\n", strerror(errno));
    }
    exit(EXIT_FAILURE);
}

int main(int argc, char *argv[])
{
    if(argc < 3) {
        fprintf(stderr, "usage: nonroot username executable [args...] \n");
        return EXIT_FAILURE;
    }
    char *username = argv[1];
    /* Look the user up */
    struct passwd *user = getpwnam(username);
    if(!user) {
        error_exit("Invalid user");
    }
    /* Don't allow UID/GID zero, for extra safety */
    if(user->pw_uid == 0 || user->pw_gid == 0) {
        error_exit("UID or GID is zero. Specify a non-root user.");
    }
    /* Change user and group */
    if(setgid(user->pw_gid)) {
        error_exit("Failed to switch user");
    }
    if(setuid(user->pw_uid)) {
        error_exit("Failed to switch user");
    }
    /* Execute command */
    char **new_argv = argv + 2;
    execvp(new_argv[0], new_argv);
    /* Only returns on error! */
    error_exit("Failed to execute the command");
}
