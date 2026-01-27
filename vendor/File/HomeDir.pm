package File::HomeDir;
use strict;
use warnings;
use File::Spec;

# Minimal shim for latexindent: resolves the user's home directory.
sub my_home {
    return $ENV{HOME} if defined $ENV{HOME} && length $ENV{HOME};
    my @pw = getpwuid($<);
    return $pw[7] if defined $pw[7] && length $pw[7];
    return File::Spec->curdir;
}

1;
