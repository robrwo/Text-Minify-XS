package Text::Minify::XS;

# ABSTRACT: Simple text minification

use v5.9.3;
use strict;
use warnings;

require Exporter;
require XSLoader;

our @ISA = qw(Exporter);
our @EXPORT_OK = qw(minify);

our $VERSION = 'v0.4.0';

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
Nor does it remove extra whitespace in the middle of the line.

=head1 KNOWN ISSUES

=head2 Support for older Perl versions

This module requires Perl v5.9.3 or newer.

Pull requests to support older versions of Perl are welcome. See
L</SOURCE>.

=head2 Malformed UTF-8

Malformed UTF-8 characters may be be mangled or omitted from the
output. You should ensure that the input string is properly encoded as
UTF-8.

=head1 SEE ALSO

L<String::Strip>

L<String::Util>

L<Text::Trim>

=cut
