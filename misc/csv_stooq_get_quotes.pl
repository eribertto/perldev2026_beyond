#!/usr/bin/env perl
use v5.40;
use utf8;
use HTTP::Tiny;
use Text::CSV_XS;
use URI::Escape qw(uri_escape);

my @symbols = @ARGV ? @ARGV : qw/aapl.us wdc.us goog.us/;

my $http = HTTP::Tiny->new(timeout => 10);
my $csv  = Text::CSV_XS->new({ binary => 1, auto_diag => 1 });

say "symbol,date,time,open,high,low,close,volume";

for my $sym (@symbols) {
    my $url = "https://stooq.com/q/l/?s=" . uri_escape($sym) .
"&f=sd2t2ohlcv&h&e=csv";

    my $res = $http->get($url);

    if (!$res->{success}) {
        warn "$sym: HTTP failed: $res->{status} $res->{reason}\n";
        next;
    }

    open my $fh, '<', \$res->{content};

    my $header = $csv->getline($fh);
    my $row    = $csv->getline($fh);

    if (!$row || !$row->[0] || $row->[0] eq 'N/D') {
        warn "$sym: no data returned\n";
        next;
    }

    my ($symbol, $date, $time, $open, $high, $low, $close, $volume) = @$row;

    say join ",", $symbol, $date, $time, $open, $high, $low, $close, $volume;
}
