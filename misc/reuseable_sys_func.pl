#!/usr/bin/env perl
use Modern::Perl '2025';    # read perldoc Modern::Perl

## use v5.40;
#use strict;
#use warnings;

sub run_cmd_safe {
    my (@cmd) = @_;

    open( my $fh, '-|', @cmd )
        or die "Cannot run command: $!";

    my $output = do {local $/; <$fh>};
    close $fh;

    return $output;
}

# substitute the function argument as needed.
my $out = run_cmd_safe('uptime');
print $out;
