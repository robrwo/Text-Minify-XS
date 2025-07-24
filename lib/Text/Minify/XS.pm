package Text::Minify::XS;

# ABSTRACT: Remove indentation and trailing whitespace from multi-line text

use v5.14;
use warnings;

use Exporter 5.57 qw( import );
use XSLoader;

our @EXPORT_OK = qw(minify minify_utf8 minify_ascii);

our $VERSION = 'v0.7.7';

XSLoader::load( __PACKAGE__, $VERSION );

{
    ## no critic (TestingAndDebugging::ProhibitNoStrict)
    no strict 'refs';
    *minify_utf8 = \&minify;
}

1;

=begin :prelude

=for stopwords BOM minify minifier

=end :prelude

=head1 SYNOPSIS

  use Text::Minify::XS qw/ minify /;

  my $out = minify( $in );

=head1 DESCRIPTION

This is a simple and fast text minifier that quickly removes extra
whitespace from multi-line text.

=head1 prepend:EXPORTS

None by default.

=export minify

  my $out = minify( $in );

This is a quick-and-dirty text minifier that removes indentation and
trailing whitespace from a multi-line text document in a single pass.

It does the following:

=over

=item *

removes leading whitespace (indentation),

=item *

removes trailing whitespace,

=item *

collapses multiple newlines,

=item *

and changes carriage returns to newlines.

=back

It does not recognise any form of markup, comments or text quoting.
Nor does it remove extra whitespace in the middle of the line.

Because it does not recognise any markup, newlines are not removed
since they may be significant.

=export minify_utf8

This is an alias for L</minify>.  It was added in v0.5.3.

=export minify_ascii

This is a version of L</minify> that works on ASCII text. It was added in v0.5.3.

If you are only processing 8-bit text, then it should be faster.
(Rudimentary benchmarks show it is twice as fast as L</minify>.)

Unlike L</minify>, if the input string has the UTF-8 flag set, the
resulting string will not.  You should ensure the string is properly
encoded.

=head1 KNOWN ISSUES

=head2 Malformed UTF-8

Malformed UTF-8 characters may be be mangled or omitted from the
output.  In extreme cases it may throw an exception in order to avoid
memory overflows. You should ensure that the input string is properly
encoded as UTF-8.

=head2 Byte Order Marks

The Byte Order Mark (BOM) at the beginning of a file will not be removed. That is because the minifier does not know
this is the beginning of a file or not.

=begin :security_considerations

=head1 SECURITY CONSIDERATIONS

Passing malformed UTF-8 characters may throw an exception, which in some cases could lead to a denial of service if
untrusted input is passed to L</minify_utf8>.  See L</KNOWN ISSUES>.

=end :security_considerations

=head1 prepend:SUPPORT

Only the latest version of this module will be supported.

Since v0.7.0, this module requires Perl v5.14 or later.
Future releases may only support Perl versions released in the last ten (10) years.

=head2 Reporting Bugs and Submitting Feature Requests

=head1 append:SUPPORT

If the bug you are reporting has security implications which make it inappropriate to send to a public issue tracker,
then see F<SECURITY.md> for instructions how to report security vulnerabilities.

=head1 append:SOURCE

See F<CONTRIBUTING.md> for more information.

=cut
