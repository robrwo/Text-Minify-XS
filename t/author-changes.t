#!perl

use v5.14;
use warnings;

BEGIN {
  unless ($ENV{AUTHOR_TESTING}) {
    print qq{1..0 # SKIP these tests are for testing by the author\n};
    exit
  }
}

use Test2::V0;

eval "use Test::CPAN::Changes";

use Text::Minify::XS;
changes_ok( { version => Text::Minify::XS->VERSION } );
