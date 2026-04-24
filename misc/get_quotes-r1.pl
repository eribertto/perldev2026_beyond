#!/usr/bin/env perl
use v5.40;
use utf8;
use Finance::Quote;

my @symbols = @ARGV ? @ARGV : qw/AAPL WDC GOOG/;

my $q = Finance::Quote->new('YahooJSON');

my %info = $q->fetch('YahooJSON', @symbols);

say "symbol,price,date,currency";

for my $symbol (@symbols) {
    if ($info{$symbol}{success}) {
        my $price    = $info{$symbol}{price}    // 'n/a';
        my $date     = $info{$symbol}{date}     // 'n/a';
        my $currency = $info{$symbol}{currency} // 'n/a';

        say "$symbol,$price,$date,$currency";
    }
    else {
        my $err = $info{$symbol}{errormsg} // 'quote fetch failed';
        warn "$symbol: $err\n";
    }
}
