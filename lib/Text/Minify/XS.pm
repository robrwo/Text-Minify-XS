package Text::Minify::XS;

# ABSTRACT: Simple text minification

use v5.6;
use strict;
use warnings;

require Exporter;
require XSLoader;

our @ISA = qw(Exporter);
our @EXPORT_OK = qw(minify);

our $VERSION = 'v0.1.0';

XSLoader::load( "Text::Minify::XS", $VERSION );

1;

=head1 SYNOPSIS

  use Text::Minify::XS qw/ minify /;

  my $out = minify( $in );

=export minify

  my $out = minify( $in );

This performs a quick-and-dirty text minifying.

Currently, it only removes leading whitespace and multiple newlines.

=cut
