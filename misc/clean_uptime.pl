#!/usr/bin/env perl

use Modern::Perl '2025';
use IPC::Run qw(run);    # make sure this module is installed by cpanm or equivalent

#use v5.40;
#use strict;
#use warnings;

# Chatgpt's recommended to avoid the backticks warning

my $out;
run ['uptime'], '>', \$out;

print $out;
