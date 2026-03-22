#!/usr/bin/env perl

use Modern::Perl '2025';

#use v5.40;
#use strict;
#use warnings;

my $cmd  = qx/uptime/;    # this backtick warning is gone by adjusting the .perlcriticrc ini file
my $exit = $? >> 8;

if ( $exit != 0 ) {
    die "uptime failed with exit code $exit\n";
}

chomp $cmd;
say "Uptime status: \n$cmd";
