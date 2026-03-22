#!/usr/bin/env perl

use v5.40;
use strict;
use warnings;

my $disk = qx(df -h /home/eriberttom);
say "Disk usage:\n$disk";
