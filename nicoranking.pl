#!/usr/bin/env perl

use strict;
use warnings;
use XML::Simple;
use LWP::Simple;
use Perl6::Say;

use constant XML_URL => 'http://www.nicovideo.jp/ranking/view/hourly/all?rss=2.0&nomemo=1&nothumbnail=1&nodescription=1';

my $xml = XML::Simple->new();
my $data = $xml->XMLin(get(XML_URL));

my @title_list;
for (@{$data->{channel}->{item}}) {
    say sprintf("%s\tcall system('open %s')", $_->{title}, $_->{link});
}


