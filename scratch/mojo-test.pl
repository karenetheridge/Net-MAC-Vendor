#!/Users/brian/bin/perls/perl5.14.2
use v5.10.1;
use utf8;
use strict;
use warnings;

use Mojo::UserAgent;

my $ua = Mojo::UserAgent->new->max_redirects(3);

my $url = 'https://services13.ieee.org/RST/standards-ra-web/rest/assignments/download/?registry=MA-L&format=html&text=00-0D-93';

my $tx = $ua->get( $url );

if( $tx->error ) {
	say "Failed fetching [$url]: " . $tx->res->code;
	say $tx->res->to_string;
	exit;
	}

my $html = $tx->res->body;
say $html;

