#!/usr/bin/env perl
use v5.40;
use utf8;
use Finance::Quote;
use Data::Dumper;

my @symbols = @ARGV ? @ARGV : qw/AAPL.US WDC.US GOOG.US/;

my $q = Finance::Quote->new;
my %info = $q->fetch('stooq', @symbols);

say "symbol,price,date,currency";

for my $symbol (@symbols) {
    if ($info{$symbol}{success}) {
        say join ",",
            $symbol,
            ($info{$symbol}{price}    // 'n/a'),
            ($info{$symbol}{date}     // 'n/a'),
            ($info{$symbol}{currency} // 'n/a');
    }
    else {
        warn "FAILED: $symbol\n";
        warn Dumper($info{$symbol});
    }
}
