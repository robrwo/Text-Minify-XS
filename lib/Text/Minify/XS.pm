package Text::Minify::XS;

# ABSTRACT: Simple text minification

use v5.9.3;
use strict;
use warnings;

require Exporter;
require XSLoader;

our @ISA = qw(Exporter);
our @EXPORT_OK = qw(minify);

our $VERSION = 'v0.3.1';

XSLoader::load( "Text::Minify::XS", $VERSION );

1;

=head1 SYNOPSIS

  use Text::Minify::XS qw/ minify /;

  my $out = minify( $in );

=export minify

  my $out = minify( $in );

This is a quick-and-dirty text minifier that removes whitespace in a
single pass.

It does the following:

=over

=item removes leading whitespace (indentation),

=item removes trailing whitespace,

=item removes multiple newlines,

=item and changes carriage returns to newlines.

=back

It does not recognise any form of markup, comments or text quoting.

=cut
