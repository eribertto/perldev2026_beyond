#!/usr/bin/env perl

use v5.40;
use utf8;
use warnings FATAL => 'all';

my $user = qx(whoami);

# get the full user home dir
my $home = '/home/' . $user;

# say my $disk = qx(df -h /home/eriberttom);
say my $disk = qx(df -h $home);
say "Disk usage:\n$disk";
