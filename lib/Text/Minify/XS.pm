package Text::Minify::XS;

# ABSTRACT: Simple text minification

use v5.6;
use strict;
use warnings;

require Exporter;
require XSLoader;

our @ISA = qw(Exporter);
our @EXPORT_OK = qw(minify);

our $VERSION = 'v0.2.1';

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

=item and changes all line endings to a newline, "\n",

=back

It does not know recognise any form of markup, comments or text quoting.

=head1 KNOWN ISSUES

This only supports ASCII/Latin-1 text.

=cut
