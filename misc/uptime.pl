#!/usr/bin/env perl

use v5.40;
use utf8;
use warnings FATAL => 'all';

my $cmd  = qx/uptime/;    # this backtick warning is gone by adjusting the .perlcriticrc ini file
my $exit = $? >> 8;

if ( $exit != 0 ) {
    die "uptime failed with exit code $exit\n";
}

chomp $cmd;
say "Uptime status: \n$cmd";
