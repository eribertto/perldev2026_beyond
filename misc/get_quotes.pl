#!/usr/bin/env perl

use v5.40;
use utf8;
use Finance::Quote;

my @symbols = @ARGV ? @ARGV : qw/AAPL MSFT GOOG/;

my $q = Finance::Quote->new('YahooJSON');
my %info = $q->fetch('yahoo_json', @symbols);

print "symbol,price,date,currency\n";
for my $s (@symbols) {
    next unless $info{$s, 'success'};
    print join(",",
        $s,
        ($info{$s, 'price'} // ''),
        ($info{$s, 'date'} // ''),
        ($info{$s, 'currency'} // '')
    ), "\n";
}
