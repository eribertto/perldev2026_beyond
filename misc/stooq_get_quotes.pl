#!/usr/bin/env perl
use v5.40;
use utf8;
use Finance::Quote;

my @symbols = @ARGV ? @ARGV : qw/aapl.us wdc.us goog.us/;

#my $source = 'stooq';
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
        my $err = $info{$symbol}{errormsg} // 'quote fetch failed';
        warn "$symbol: $err\n";
    }
}
