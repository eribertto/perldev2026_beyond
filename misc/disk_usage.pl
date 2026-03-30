#!/usr/bin/env perl

use Modern::Perl '2025';

#use strict;
#use warnings;

my $user = qx(whoami);

#say "Your username is $user";

# get the full user home dir
my $home = '/home/' . $user;

#say "Your home directory is $home";

# say my $disk = qx(df -h /home/eriberttom);
say my $disk = qx(df -h $home);
say "Disk usage:\n$disk";
